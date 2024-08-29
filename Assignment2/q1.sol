// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title Hello World Contract
/// @notice This contract returns a simple "Hello, World!" message.
contract HelloWorld {
    /// @notice Returns the string "Hello, World!"
    /// @return A string message "Hello, World!"
    function helloWorld() public pure returns (string memory) {
        return "Hello, World!";
    }
}
