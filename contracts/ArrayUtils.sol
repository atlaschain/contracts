pragma solidity ^0.4.0;
library ArrayUtils {

  /** Finds the index of a given value in an array. */
  function indexOf(address[] storage self, address value) returns (uint) {
    for (uint i = 0; i < self.length; i++)
    if (self[i] == value) return i;
    return uint(-1);
  }

  /** Removes the given value in an array. */
  /*function RemoveByValue(address[] values, address value) {
    uint i = IndexOf(values, value);
    RemoveByIndex(values, i);
    }*/

    /** Removes the value at the given index in an array. */
    /*function RemoveByIndex(address[] values, uint i) {
      while (i<values.length-1) {
        values[i] = values[i+1];
        i++;
      }
      values.length--;
      }*/
    }
