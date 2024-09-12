// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DonationContract {

    // Struct to store donor information
    struct Donation {
        uint amount;
        uint timestamp;
    }

    // Mapping to keep track of donations for each donor
    mapping(address => Donation[]) private donations;

    // Event to log each donation
    event DonationMade(address indexed donor, address indexed recipient, uint amount, uint timestamp);

    // Function to make a donation
    function donate(address payable recipient) public payable {
        require(msg.value > 0, "Donation amount must be greater than zero");

        // Transfer the donated amount to the recipient
        recipient.transfer(msg.value);

        // Record the donation
        donations[msg.sender].push(Donation({
            amount: msg.value,
            timestamp: block.timestamp
        }));

        // Emit the donation event
        emit DonationMade(msg.sender, recipient, msg.value, block.timestamp);
    }

    // Function to get donation history of the sender
    function getDonationHistory() public view returns (Donation[] memory) {
        return donations[msg.sender];
    }

    // Function to get total donations made by a donor
    function getTotalDonations() public view returns (uint) {
        uint total = 0;
        Donation[] memory donorDonations = donations[msg.sender];
        for (uint i = 0; i < donorDonations.length; i++) {
            total += donorDonations[i].amount;
        }
        return total;
    }
}
