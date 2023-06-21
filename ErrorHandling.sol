// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract RevertAssertREquire {


    address public owner;


    constructor() {
        owner = msg.sender;
    }


    function TestREvert() public view returns (string memory)
    {
        // if(msg.sender != owner) { revert(); }
        if(msg.sender != owner) {
            revert("You are not the owner"); //error handling dengan pesan
        }
        else
        {
            return "you are the owner";
        }
    }


    function TestAssert() public view returns (string memory)
    {
        assert(msg.sender == owner); //stop jika hasil false, error handling tanpa pesan
        return "dibaca karena kondisi sesuai (menghasilkan true)";
    }

    modifier isOwner() {
        require(msg.sender == owner, "Caller is not owner");
        _;
    }

    function TestRequire() public isOwner view returns (string memory)
    {
          return "dibaca karena kondisi sesuai (menghasilkan true)";
    }
}
