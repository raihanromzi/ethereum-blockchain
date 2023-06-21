// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
// import "@openzeppelin/contracts/access/Ownable.sol";

// Ownable -> Proteksi dari hacker
// Menggunakan pecahan wei
contract TokenPunyaGue is ERC20 /*Ownable*/ {
    constructor(address to, uint256 amount) ERC20("Uang Palsu", "IDP") {
        _mint(to, amount);
    }
}

// 10rb token
// 10000000000000000000000
