// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract GlobalVariables {

    function globalVars() external view returns (address, uint, uint, uint) {
        address sender = msg.sender;
        uint timestamp = block.timestamp;
        uint blockNum  = block. number;
        uint gasLeft = gasleft();
        return (sender, timestamp, blockNum, gasLeft);
    }
    
}
