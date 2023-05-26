// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract Calculator {

  int private number1;
  int private number2;

  function inputNumber1(int _input) public {
    number1 =  _input;
  }

  function inputNumber2(int _input) public {
    number2 = _input;
  }

  function add() public view returns(int) {
    return number1 + number2;
  }

  function minus() public view returns(int){
    return number1 - number2;
  }

}
