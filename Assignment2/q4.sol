// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title Simple Counter Contract
/// @notice This contract keeps track of a count and allows it to be incremented.
contract SimpleCounter {
    uint private count;

    /// @notice Increments the counter by 1
    function incrementCount() public {
        count += 1;
    }

    /// @notice Retrieves the current count
    /// @return The current count value
    function getCount() public view returns (uint) {
        return count;
    }
}
