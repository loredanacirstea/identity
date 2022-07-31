// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "./FeatureLib.sol";

contract Feature1 {
  // specific to this contract
  bytes16 TID = bytes16(bytes1(0x01));

  struct ValueWrap { 
    uint256 index;
    FeatureLib.Value value;
  }

    
  // key => ValueWrap
  mapping(bytes32 => ValueWrap) public values;
  bytes32[] private valueIndex;

  event LogNew   (uint256 indexed index, bytes32 indexed key);
  event LogUpdate(uint256 indexed index, bytes32 indexed key);
  event LogRemove(uint256 indexed index, bytes32 indexed key);

  function getKey(FeatureLib.Value memory v) view public returns (bytes32 key) {
    return keccak256(abi.encodePacked(
      TID,
      v.addedBy,
      v.target,
      v.proofType,
      v.proofID,
      v.label
    ));
  }
  
  function isInstance(bytes32 key)
    public 
    view
    returns(bool isIndeed) 
  {
    if(valueIndex.length == 0) return false;
    return (valueIndex[values[key].index] == key);
  }

  function insert(FeatureLib.Value memory value) 
    public
    returns(uint index)
  {
    bytes32 key = getKey(value);
    values[key].value = value;
    values[key].index = valueIndex.length;
    valueIndex.push(key);
    emit LogNew(index, key);
    return valueIndex.length-1;
  }

  function remove(bytes32 key) 
    public
    returns(uint index)
  {
    require(isInstance(key), "Key does not belong to an instance");
    uint rowToRemove = values[key].index;
    bytes32 keyToMove = valueIndex[valueIndex.length-1];
    valueIndex[rowToRemove] = keyToMove;
    values[keyToMove].index = rowToRemove; 
    valueIndex.pop();
    emit LogRemove(rowToRemove, key);
    emit LogUpdate(rowToRemove, keyToMove);
    return rowToRemove;
  }
  
  function get(bytes32 key)
    public 
    view
    returns(FeatureLib.Value memory value)
  {
    require(isInstance(key), "Key does not belong to an instance");
    return values[key].value;
  } 

  function count() 
    public
    view
    returns(uint counter)
  {
    return valueIndex.length;
  }

  function getKeyAtIndex(uint index)
    public
    view
    returns(bytes32 key)
  {
    return valueIndex[index];
  }

  function getAtIndex(uint index)
    public
    view
    returns(FeatureLib.Value memory value)
  {
    return get(getKeyAtIndex(index));
  }
}

