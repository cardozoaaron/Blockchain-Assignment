// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title Message Storage Contract
/// @notice This contract allows a user to store and retrieve a message string.
contract MessageStorage {
    string private message;

    /// @notice Stores a message string
    /// @param _message The message to be stored
    function storeMessage(string memory _message) public {
        message = _message;
    }

    /// @notice Retrieves the stored message string
    /// @return The stored message
    function retrieveMessage() public view returns (string memory) {
        return message;
    }
}
