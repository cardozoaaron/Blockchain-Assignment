// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title Crowdfunding Smart Contract
/// @notice This contract allows users to create and participate in crowdfunding campaigns
contract Crowdfunding {
    // Struct to represent a crowdfunding campaign
    struct Campaign {
        address creator;      // Address of the campaign creator
        uint256 goal;         // Funding goal in wei
        uint256 deadline;     // Timestamp of the campaign deadline
        uint256 totalFunds;   // Total funds collected so far
        bool finalized;       // Whether the campaign has been finalized
        mapping(address => uint256) contributions;  // Mapping of contributor addresses to their contribution amounts
    }

    // Mapping to store all campaigns, indexed by a unique campaign ID
    mapping(uint256 => Campaign) public campaigns;
    uint256 public campaignCount;  // Total number of campaigns created

    // Events to log important actions
    event CampaignCreated(uint256 campaignId, address creator, uint256 goal, uint256 deadline);
    event ContributionMade(uint256 campaignId, address contributor, uint256 amount);
    event CampaignFinalized(uint256 campaignId, bool successful);

    /// @notice Creates a new crowdfunding campaign
    /// @param _goal The funding goal in wei
    /// @param _durationInDays The duration of the campaign in days
    function createCampaign(uint256 _goal, uint256 _durationInDays) external {
        require(_goal > 0, "Goal must be greater than 0");
        require(_durationInDays > 0, "Duration must be greater than 0");

        uint256 campaignId = campaignCount++;
        Campaign storage newCampaign = campaigns[campaignId];
        newCampaign.creator = msg.sender;
        newCampaign.goal = _goal;
        newCampaign.deadline = block.timestamp + (_durationInDays * 1 days);
        newCampaign.totalFunds = 0;
        newCampaign.finalized = false;

        emit CampaignCreated(campaignId, msg.sender, _goal, newCampaign.deadline);
    }

    /// @notice Allows users to contribute funds to a specific campaign
    /// @param _campaignId The ID of the campaign to contribute to
    function contribute(uint256 _campaignId) external payable {
        Campaign storage campaign = campaigns[_campaignId];
        require(block.timestamp < campaign.deadline, "Campaign has ended");
        require(!campaign.finalized, "Campaign is already finalized");
        require(msg.value > 0, "Contribution must be greater than 0");

        campaign.contributions[msg.sender] += msg.value;
        campaign.totalFunds += msg.value;

        emit ContributionMade(_campaignId, msg.sender, msg.value);
    }

    /// @notice Finalizes a campaign, releasing funds if successful or allowing withdrawals if not
    /// @param _campaignId The ID of the campaign to finalize
    function finalizeCampaign(uint256 _campaignId) external {
        Campaign storage campaign = campaigns[_campaignId];
        require(msg.sender == campaign.creator, "Only the creator can finalize the campaign");
        require(block.timestamp >= campaign.deadline, "Campaign hasn't ended yet");
        require(!campaign.finalized, "Campaign is already finalized");

        campaign.finalized = true;

        if (campaign.totalFunds >= campaign.goal) {
            payable(campaign.creator).transfer(campaign.totalFunds);
            emit CampaignFinalized(_campaignId, true);
        } else {
            emit CampaignFinalized(_campaignId, false);
        }
    }

    /// @notice Allows contributors to withdraw their funds if the campaign was unsuccessful
    /// @param _campaignId The ID of the campaign to withdraw from
    function withdrawContribution(uint256 _campaignId) external {
        Campaign storage campaign = campaigns[_campaignId];
        require(campaign.finalized, "Campaign is not finalized yet");
        require(campaign.totalFunds < campaign.goal, "Campaign was successful, cannot withdraw");
        
        uint256 contribution = campaign.contributions[msg.sender];
        require(contribution > 0, "No contribution to withdraw");

        campaign.contributions[msg.sender] = 0;
        payable(msg.sender).transfer(contribution);
    }

    /// @notice Retrieves the details of a specific campaign
    /// @param _campaignId The ID of the campaign to get details for
    /// @return creator The address of the campaign creator
    /// @return goal The funding goal of the campaign
    /// @return deadline The deadline timestamp of the campaign
    /// @return totalFunds The total funds raised so far
    /// @return finalized Whether the campaign has been finalized
    function getCampaignDetails(uint256 _campaignId) external view returns (
        address creator,
        uint256 goal,
        uint256 deadline,
        uint256 totalFunds,
        bool finalized
    ) {
        Campaign storage campaign = campaigns[_campaignId];
        return (
            campaign.creator,
            campaign.goal,
            campaign.deadline,
            campaign.totalFunds,
            campaign.finalized
        );
    }

    /// @notice Gets the contribution amount of a specific address for a campaign
    /// @param _campaignId The ID of the campaign
    /// @param _contributor The address of the contributor
    /// @return The amount contributed by the address to the specified campaign
    function getContribution(uint256 _campaignId, address _contributor) external view returns (uint256) {
        return campaigns[_campaignId].contributions[_contributor];
    }
}