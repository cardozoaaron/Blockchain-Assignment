// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title Simple Ledger Contract
/// @notice This contract maintains a ledger of transactions with basic entries.
contract SimpleLedger {
    struct Transaction {
        address from;
        address to;
        uint amount;
    }

    Transaction[] private transactions;

    /// @notice Adds a transaction to the ledger
    /// @param _to The recipient's address
    /// @param _amount The transaction amount
    function addTransaction(address _to, uint _amount) public {
        transactions.push(Transaction(msg.sender, _to, _amount));
    }

    /// @notice Retrieves a transaction by its index
    /// @param _index The index of the transaction
    /// @return The transaction details
    function getTransaction(uint _index) public view returns (address, address, uint) {
        Transaction memory txn = transactions[_index];
        return (txn.from, txn.to, txn.amount);
    }
}
