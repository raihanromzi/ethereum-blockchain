// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

// PascalCase
contract GlobalVariables {

  // Jika tidak menggunakan jumlah bit, akan default ke uint256
  // Jika tidak menuliskan private / public, maka default ke private
  uint8 public a = 1;
  uint16 b = 2;
  uint32 private c = 3;
  uint256 private d = 4;

  // boolean
  bool public e = true;
  bool public f = b == c;

  // string
  string public g = "Hello World!";

  // byte
  bytes11 public h = "Ini Bytes11";

    // camelCase
    // view -> Tidak mengubah semua variable, untuk memberitahu compiler
    // internal -> Tidak muncul di global variable
    // tupple -> lebih dari satu return

    function globalVars() public view returns (uint, address) {
        uint timestamp = block.timestamp;
        // address yang menjalankan function tersebut, yang mengeksekusi

        // msg.sender -> address yang mengirimkan transaksi
        address sender = msg.sender;
        return (timestamp, sender);
    }

    // string memory -> semua
    function globalString() public view returns (string memory) {
      return (g);
    }

}
