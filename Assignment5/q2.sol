// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title Voting System Smart Contract
/// @notice This contract implements a simple voting system where users can create proposals and vote on them
contract VotingSystem {
    // Struct to represent a proposal
    struct Proposal {
        string description;   // Description of the proposal
        uint256 voteCount;    // Number of votes received
    }

    // Struct to represent a voter's status for a specific proposal
    struct Voter {
        bool hasVoted;        // Whether the voter has already voted
        uint256 votedProposalId;  // The ID of the proposal they voted for
    }

    // Mapping to store all proposals, indexed by a unique proposal ID
    mapping(uint256 => Proposal) public proposals;
    // Nested mapping to track voting status: address -> proposalId -> Voter
    mapping(address => mapping(uint256 => Voter)) public voters;
    uint256 public proposalCount;  // Total number of proposals created

    // Events to log important actions
    event ProposalCreated(uint256 proposalId, string description);
    event VoteCast(address voter, uint256 proposalId);

    /// @notice Creates a new proposal
    /// @param _description The description of the new proposal
    function createProposal(string memory _description) external {
        uint256 proposalId = proposalCount++;
        proposals[proposalId] = Proposal(_description, 0);
        emit ProposalCreated(proposalId, _description);
    }

    /// @notice Allows a user to vote on a specific proposal
    /// @param _proposalId The ID of the proposal to vote on
    function vote(uint256 _proposalId) external {
        require(_proposalId < proposalCount, "Invalid proposal ID");
        require(!voters[msg.sender][_proposalId].hasVoted, "Already voted on this proposal");

        voters[msg.sender][_proposalId].hasVoted = true;
        voters[msg.sender][_proposalId].votedProposalId = _proposalId;
        proposals[_proposalId].voteCount++;

        emit VoteCast(msg.sender, _proposalId);
    }

    /// @notice Retrieves the details of a specific proposal
    /// @param _proposalId The ID of the proposal to get details for
    /// @return description The description of the proposal
    /// @return voteCount The number of votes the proposal has received
    function getProposal(uint256 _proposalId) external view returns (string memory description, uint256 voteCount) {
        require(_proposalId < proposalCount, "Invalid proposal ID");
        Proposal storage proposal = proposals[_proposalId];
        return (proposal.description, proposal.voteCount);
    }

    /// @notice Determines the winning proposal based on the highest number of votes
    /// @return winningProposalId The ID of the winning proposal
    /// @return description The description of the winning proposal
    /// @return voteCount The number of votes received by the winning proposal
    function getWinningProposal() external view returns (uint256 winningProposalId, string memory description, uint256 voteCount) {
        require(proposalCount > 0, "No proposals exist");

        uint256 winningVoteCount = 0;
        for (uint256 i = 0; i < proposalCount; i++) {
            if (proposals[i].voteCount > winningVoteCount) {
                winningVoteCount = proposals[i].voteCount;
                winningProposalId = i;
            }
        }

        Proposal storage winningProposal = proposals[winningProposalId];
        return (winningProposalId, winningProposal.description, winningProposal.voteCount);
    }

    /// @notice Checks if a specific voter has voted on a specific proposal
    /// @param _voter The address of the voter to check
    /// @param _proposalId The ID of the proposal to check
    /// @return Whether the voter has voted on the specified proposal
    function hasVoted(address _voter, uint256 _proposalId) external view returns (bool) {
        return voters[_voter][_proposalId].hasVoted;
    }
}