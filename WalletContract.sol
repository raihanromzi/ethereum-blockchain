// SPDX-License-Identifier: MIT
pragma solidity 0.8;

// Siap untuk menerima Fund
contract walletContract {

    // Function to receive Ether. msg.data must be empty
    receive() external payable {}

    // Fallback function is called when msg.data is not empty
    fallback() external payable {}

    function getSenderBalance() public view returns(uint){
        return msg.sender.balance;
    }

    function getAddressBalance(address _addr) public view returns(uint){
        return _addr.balance;
    }

    function getContractBalance() public view returns(uint){
        // As of Solidity ^0.4.24, you need to do: address(this).balance
        // In Solidity 0.5.0, this.balance will be explicitly forbidden,
        // and you will be required to explicitly convert to the address object before you can access it's functions.

        // return this.address.balance;
        return address(this).balance;
    }

}
