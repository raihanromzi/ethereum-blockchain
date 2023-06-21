// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


// Counter.sol
contract Counter {
    uint public count;
    function increment() external {
        count += 1;
    }
}
