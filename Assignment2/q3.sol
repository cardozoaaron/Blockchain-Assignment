// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title Greeting Contract
/// @notice This contract allows a user to set and get a personalized greeting message.
contract Greeting {
    string private greeting;

    /// @notice Sets a personalized greeting message
    /// @param _greeting The greeting message to be stored
    function setGreeting(string memory _greeting) public {
        greeting = _greeting;
    }

    /// @notice Retrieves the personalized greeting message
    /// @return The stored greeting message
    function getGreeting() public view returns (string memory) {
        return greeting;
    }
}
