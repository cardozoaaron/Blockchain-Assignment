// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title Event Logging Contract
/// @notice This contract logs events when certain actions are performed.
contract EventLogging {
    event ActionPerformed(address indexed performer, string action);

    /// @notice Logs an action performed by the caller
    /// @param _action The action performed
    function logAction(string memory _action) public {
        emit ActionPerformed(msg.sender, _action);
    }
}
