// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

// Setiap keturunannnya harus memiliki function getResult()
// Tidak bisa dicompile, karena bukan contract
interface Calculator {
   function getResult() external view returns(uint);
}

contract Test is Calculator {
   constructor() {}
   function getResult() external pure returns(uint){
      uint a = 1;
      uint b = 2;
      uint result = a + b;
      return result;
   }
}
