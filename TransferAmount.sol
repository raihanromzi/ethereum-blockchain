// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract TransferAmount {

  function send(address payable _to) public payable {
    _to.transfer(msg.value);
  }

  function checkBalance(address payable _to) public view returns (uint) {
    return _to.balance;
  }

}
