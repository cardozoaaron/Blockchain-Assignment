// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title Owner Access Contract
/// @notice This contract restricts certain functions to only the contract owner.
contract OwnerAccess {
    address private owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the contract owner!");
        _;
    }

    /// @notice Example function restricted to the contract owner
    function ownerOnlyFunction() public view onlyOwner returns (string memory) {
        return "This function can only be called by the owner.";
    }
}
