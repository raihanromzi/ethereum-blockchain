// SPDX-License-Identifier: MIT
pragma solidity 0.8;

contract MappingVar {

     mapping (string => uint) namaumur;

     function tambahData(string memory _nama, uint _umur) public {

          namaumur[_nama] = _umur;
     }

     function lihatData(string memory _nama) public view returns (uint) {

          return namaumur[_nama];
     }

     function hapusData(string memory _nama) public {
          delete namaumur[_nama];
     }

}
