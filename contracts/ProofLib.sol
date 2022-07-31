// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

library ProofLib {
    struct Value {
      address addedBy;
      address target;
      uint256 validUntil; // timestamp
      // the id of the feature superceeded (if any)
      bytes16 superceeds;
      // IPFS CID
      bytes CID;
    }
}

