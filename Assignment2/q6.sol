// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title Basic Voting Contract
/// @notice This contract allows users to vote for a candidate and keeps track of votes.
contract BasicVoting {
    mapping(string => uint) private votes;

    /// @notice Vote for a candidate
    /// @param _candidate The candidate's name
    function vote(string memory _candidate) public {
        votes[_candidate] += 1;
    }

    /// @notice Retrieves the vote count for a candidate
    /// @param _candidate The candidate's name
    /// @return The vote count for the candidate
    function getVoteCount(string memory _candidate) public view returns (uint) {
        return votes[_candidate];
    }
}
