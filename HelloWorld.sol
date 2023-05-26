// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract HelloWorld {

  string private name = "Hello Ethereum!";

  function getHelloWorld() public view returns (string memory) {
    return name;
  }

}
