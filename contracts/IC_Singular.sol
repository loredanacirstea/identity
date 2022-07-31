// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "./FeatureLib.sol";
import "./FeatureContract1.sol";
import "./ProofLib.sol";
import "./ProofContract1.sol";

/// @title A standard for identity
/// @author The Laurel Project
/// @notice It ensures unicity of nicknames across blockchains
/// @dev Technical demos are at https://www.youtube.com/c/LoredanaCirstea/videos
/// custom:license This is covered by The Moral Licence - that is more strict than GPL-3.0
contract IC_Singular  {
    address public AbstractAccountsAddress = 0x000000000000000000000000000000000000001a;
    address public Features;
    address public Proofs;

    // featureType => address
    mapping (bytes16 => address) public featureContracts;
    // proofType => address
    mapping (bytes16 => address) public proofContracts;

    // owner => names
    mapping(address => string) public addressToName;
    mapping(string => address) public nameToOwner;
    // owner => featureType => featureID
    mapping(address => mapping(bytes16 => uint256)) allFeatures;
    // owner => features
    mapping(address => mapping(bytes16 => uint256)) allProofs;
    
    /// @notice Checks if the identity does not exist
    /// @dev Careful: it returns the reverse of existing
    /// @param nickname The nickname string
    /// @return notThere True if this nickname does not exist
    function notExtant(
        string memory nickname
    ) view public returns (bool notThere) {
        address owner = nameToOwner[nickname];
        if (owner == address(0x00)) {
            return false;
        }
        return true;
    }
    
    /// @notice Adds a nickname on all chains as an alias for the sender address. Fails if it already exists (the nickname or the address)
    /// @dev Has to be further improved to become atomic (dependent on nBridge)
    /// @param nickname The string
    /// @return success True if executed
    function addNickname(
        address owner,
        string memory nickname
    ) public returns (
        bool success
    ) {
        require(msg.sender == getAbstractAccountAddress(owner), "Abstract account not authorized");
        require(notExtant(nickname) == false, "Nickname already exists");
        addressToName[owner] = nickname;
        nameToOwner[nickname] = owner;
    }
    
    // TODO: sender must have permission to addFeature
    function addFeature(
        string memory nickname,
        bytes16 featureType,
        bytes16 proofType,
        bytes16 proofID,
        bytes32 label,
        bytes memory value
    ) public returns  (
        uint256 featureID
    ) {
        address owner = nameToOwner[nickname];
        require(owner != address(0x0), "Owner does not exist");

        address featureAddress = featureContracts[featureType];
        require(featureAddress != address(0x0), "Feature type does not exist");

        address proofAddress = proofContracts[proofType];
        require(proofAddress != address(0x0), "Proof type does not exist");

        Feature1 featureContract = Feature1(featureAddress);
        FeatureLib.Value memory feature = FeatureLib.Value(
            msg.sender,
            owner,
            proofType,
            proofID,
            bytes16(0),
            label,
            value
        );
        uint256 featureID = featureContract.insert(feature);
        allFeatures[owner][featureType] = featureID;
        return featureID;
    }
    
    function addFeatureType(
        bytes16 featureType,
        address contractAddr
    ) public returns  (
        bool success
    ) {
        featureContracts[featureType] = contractAddr;
    }
    
    function addProof(
        string memory nickname,
        bytes16 proofType,
        address addedBy,
        address target,
        uint256 validUntil,
        bytes memory CID
    ) public returns  (
        uint256 proofID
    ) {
        address owner = nameToOwner[nickname];
        require(owner != address(0x0), "Owner does not exist");

        address proofAddress = proofContracts[proofType];
        require(proofAddress != address(0x0), "Proof type does not exist");

        Proof1 proofContract = Proof1(proofAddress);
        ProofLib.Value memory proof = ProofLib.Value(
            msg.sender,
            owner,
            validUntil,
            bytes16(0x0),
            CID
        );

        uint256 proofID = proofContract.insert(proof);
        allProofs[owner][proofType] = proofID;
        return proofID;
    }
    
    function addProofType(
        bytes16 proofType,
        address contractAddr
    ) public returns  (
        bool success
    ) {
        proofContracts[proofType] = contractAddr;
    }

    function getAbstractAccountAddress(address owner) internal returns (address account) {
        bytes memory payload = abi.encodeWithSignature(
            "getAccountAddress(address)",
            owner
        );

        (bool success, bytes memory data) = AbstractAccountsAddress.call(payload);
        if (!success) revert("AA precompile getAccountAddress failed");
        bytes memory res = abi.decode(data, (bytes));
        account = abi.decode(res, (address));
        return account;
    }
}
