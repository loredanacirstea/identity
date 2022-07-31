// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/// @title A standard for identity
/// @author The Laurel Project
/// @notice It ensures unicity of nicknames across blockchains
/// @dev Technical demos are at https://www.youtube.com/c/LoredanaCirstea/videos
/// custom:license This is covered by The Moral Licence - that is more strict than GPL-3.0
interface IC_Singular {

    struct Value { 
      address owner;
      bytes16[][] allFeatures;
      bytes16[][] allProofs;
      
    }
    
    /// @notice Checks if the identity does not exist
    /// @dev Careful: it returns the reverse of existing
    /// @param nickname The nickname string
    /// @return notThere True if this nickname does not exist
    function notExtant(
        bytes memory nickname
    ) view external returns (bool notThere);
    
    /// @notice Adds a nickname on all chains as an alias for the sender address. Fails if it already exists (the nickname or the address)
    /// @dev Has to be further improved to become atomic (dependent on nBridge)
    /// @param nickname The string
    /// @return success True if executed
    function addNickname(
        bytes memory nickname
    ) external returns (
        bool success
    );
    
    function addFeature(
        bytes memory nickname,
        bytes16 featureType,
        bytes16 featureID,
        bytes16 proofType,
        bytes16 proofID
    ) external returns  (
        bool success
    );
    
    function addFeatureType(
        bytes16 featureType,
        address contractAddr
    ) external returns  (
        bool success
    );
    
    // external contracts add features
   //  mapping (
   //  bytes16 => address) featureContract;
    
    struct Feature { 
        address addedBy;
        address target;
        // the id of the feature superceeded (if any)
        bytes16 proofType;
        bytes16 proofID;
        bytes16 superceeds;
        bytes32 label;
        bytes value;
    }
    
    
    function addProof(
        bytes memory nickname,
        bytes16 proofType,
        bytes16 proofID
    ) external returns  (
        bool success
    );
    
    function addProofType(
        bytes16 proofType,
        address contractAddr
    ) external returns  (
        bool success
    );
}