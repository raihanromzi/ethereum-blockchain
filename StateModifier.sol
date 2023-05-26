// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

// State Modifier

contract myContract {

    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner {
        require(msg.sender == owner, "Hanya owner saja");
        // next
        _;
    }

    // Jangan dibikin -> bahaya hacker
    function changeOwner(address _newOwner) onlyOwner public {
        owner = _newOwner;
    }

}
