// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract contractA {

    string public name;

    uint256 x = 1324;
    uint256 y = 4444;

    constructor(string memory tokenName) {
        name = tokenName;
    }

    function setName(string memory newName) public returns ( string memory){
        name = newName;
        return newName;
    }

   function setXY(uint _x, uint _y) public returns (uint) {
        x = _x;
        y = _y;
        return x + y;
   }


}

contract contractB  {
    event Log(string msg);
    string public myName;

    function call(address addr, string memory newName) public {
        // Untuk uint / int -> uint256 / int256
        bytes memory payload = abi.encodeWithSignature("setName(string)", newName);

        // Result -> berupa hexa
        (bool success, bytes memory result)= addr.call(payload);

        // Decode data
        string memory name = abi.decode(result, (string));

        myName = name;
        emit Log(name);
    }
}
