// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract myArray {

   struct Book {
      string title;
      string author;
      uint book_id;
   }

    Book[] buku;

    uint[5] public valueFixed;
    uint[] public valueDynamic;
    uint[] public movedDynamic;

    function arrayFixed() public {
        valueFixed = [10,20,30,40,50];
    }

    function addArrDynamic(uint _num) public {
        valueDynamic.push(_num);
    }

    function getArrDynamic(uint _no) public view returns (uint) {
        return valueDynamic[_no];
    }

    function moveArrDynamic() public {
        for (uint i=0; i<valueDynamic.length; i++) {
            movedDynamic.push(valueDynamic[i]);
        }
    }


}
