// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Payment {
    // Mapping to store user balances
    mapping(address => uint256) public balances;

    // Event to notify when a deposit is made
    event Deposit(address indexed user, uint256 amount);

    // Event to notify when a withdrawal is made
    event Withdrawal(address indexed user, uint256 amount);

    // Function to allow users to deposit Ether
    function deposit() public payable {
        require(msg.value > 0, "Deposit must be greater than zero");
        balances[msg.sender] += msg.value;
        emit Deposit(msg.sender, msg.value);
    }

    // Function to get the balance of the caller
    function getBalance() public view returns (uint256) {
        return balances[msg.sender];
    }

    // Function to withdraw Ether from the contract
    function withdraw(uint256 amount) public {
        require(balances[msg.sender] >= amount, "Insufficient balance");
        balances[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);
        emit Withdrawal(msg.sender, amount);
    }
}
