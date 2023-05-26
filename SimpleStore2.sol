// SPDX-License-Identifier: MIT
pragma solidity 0.8;

contract TokoKelontong {

       address public ownerAddress;

       //the sellable item
       struct etalaseBarang {
            string namaBarang;
            uint stokBarang;
            uint hargaBarang;
        }

        etalaseBarang[] public listetalaseBarang;

        constructor(){
             ownerAddress = msg.sender;
         }

        modifier onlyOwner {
            require(msg.sender == ownerAddress, "Only owner can call this function!");
            _;
        }

        receive() external payable{}
        // fallback() external payable {}

        //tambahBarang
        function tambahBarang(string memory _namaBarang, uint _stokBarang, uint _hargaBarang) public onlyOwner
        {
            // require(msg.sender == ownerAddress, "Hanya owner yang bisa tambah Barang");
            require( _stokBarang > 0 , "stok harus lebih dari 0"); // check if stock inputed is 0
            etalaseBarang memory etalaseBarangData = etalaseBarang(_namaBarang, _stokBarang, _hargaBarang);
            listetalaseBarang.push(etalaseBarangData);
        }

        //to purchase product
        function beliBarang(uint _barangID, uint _jumlahPembelian) public  payable returns (uint itemID, string memory namaBarang, uint hargaBarang, uint stokBarang,uint jumlahPembelian, string memory status)
        {

              itemID =  _barangID;
              namaBarang = listetalaseBarang[itemID].namaBarang;
              hargaBarang = listetalaseBarang[itemID].hargaBarang;
              stokBarang = listetalaseBarang[itemID].stokBarang;
              jumlahPembelian = _jumlahPembelian;

              require(stokBarang>=0, "Stok barang habis, silahkan pesan barang yang lain"); //check for stock
              require(jumlahPembelian<=stokBarang, "Stok barang tidak cukup, silahkan menurunkan jumlah pembelian"); //check for stock
              require(msg.value>=hargaBarang, "saldo uang tidak cukup"); //check for payment


              payable(address(this)).transfer(msg.value); //send the money to contract

              listetalaseBarang[itemID].stokBarang = listetalaseBarang[itemID].stokBarang - jumlahPembelian ; // reduce the stock in vending machine

              status = "pembelian sukses, silahkan ambil barang di tray";
        }

        function saldoToko() public view returns (uint) {
             return address(this).balance; //ambil address contract
             //return msg.sender.balance; //ambil address sender
        }

        function senderAddress() public view returns (address) {
             return msg.sender;
        }


}
