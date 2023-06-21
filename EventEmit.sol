// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract Purchase {


    address public seller;


    modifier onlyseller() {         //modifier
        require(msg.sender==seller, "only seller can access this");
        _;
    }


    event assignSeller(address seller, string valueMessage);
    event bidProses(address seller, string valueMessage);


    function bid() public onlyseller returns (string memory){  //function
        emit bidProses(msg.sender,"telah melakukan bid");
        return "you are the seller";
    }


    function registerSeller() public {
        seller = msg.sender;
        emit assignSeller(msg.sender,"telah diassign menjadi seller");
    }


}
