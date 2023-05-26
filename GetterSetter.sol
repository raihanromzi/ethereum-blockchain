// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract GetterSetter {

  uint storedData; // state memory / blockchain storage

  // variable di paramter biasanya ada _ di depannya
  function setData(uint _input) public {
    storedData = _input;
  }

  function getData() public view returns (uint) {
    return storedData;
  }

}
