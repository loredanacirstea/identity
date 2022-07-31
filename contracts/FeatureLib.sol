// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

library FeatureLib {
    struct Value { 
      address addedBy;
      address target;
      bytes16 proofType;
      bytes16 proofID;
      // the id of the feature superceeded (if any)
      bytes16 superceeds;
      bytes32 label;
      bytes value;
    }
}

