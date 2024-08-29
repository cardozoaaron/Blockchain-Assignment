// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title Name Storage Contract
/// @notice This contract allows storing and retrieving a user's name.
contract NameStorage {
    string private name;

    /// @notice Stores the user's name
    /// @param _name The name to be stored
    function setName(string memory _name) public {
        name = _name;
    }

    /// @notice Retrieves the stored name
    /// @return The stored name
    function getName() public view returns (string memory) {
        return name;
    }
}
