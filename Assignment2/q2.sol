// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title Simple Storage Contract
/// @notice This contract allows storing and retrieving a single integer value.
contract SimpleStorage {
    uint private storedValue;

    /// @notice Stores a single integer value
    /// @param _value The value to be stored
    function setStoredValue(uint _value) public {
        storedValue = _value;
    }

    /// @notice Retrieves the stored integer value
    /// @return The stored integer value
    function getStoredValue() public view returns (uint) {
        return storedValue;
    }
}
