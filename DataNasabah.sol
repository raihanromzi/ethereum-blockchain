// SPDX-License-Identifier: MIT
pragma solidity 0.8;

contract DataNasabah {

    struct Nasabah {
        address rekening;
        string nama;
        string alamat;
        string job;
        uint blockTime;
        uint blockNumber;
    }

    Nasabah nasabah;

    mapping (address => Nasabah) dataNasabah;

    address public ownerAddress;

    constructor() {
        ownerAddress = msg.sender;
    }

    modifier onlyOwner {
        require(ownerAddress == msg.sender, "Only Owner!");
        _;
    }

    function registerNasabah(address rekening, string memory _nama, string memory _alamat, string memory _job) public onlyOwner {
        Nasabah memory nasabahBaru = Nasabah(rekening, _nama, _alamat, _job, block.timestamp, block.number);
        dataNasabah[nasabahBaru.rekening] = nasabahBaru;
    }

    function getNasabah(address rekening) public view onlyOwner returns (Nasabah memory) {
        return dataNasabah[rekening];
    }

    function deleteNasabah(address rekening) public {
        delete dataNasabah[rekening];
    }

}
