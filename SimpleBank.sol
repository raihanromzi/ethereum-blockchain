// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract SimpleBank {

  address private owner;
  event Log (uint amount, uint gas);

  constructor() {
    owner = msg.sender;
  }

  function checkBalance(address _account) public view returns (uint) {
    return _account.balance;
  }

  function sendEther(address payable _account) public payable {
    require(
      msg.sender == owner,
      "Only Owner of wallet can send ETH!"
    );
    _account.transfer(msg.value);
  }

   function withdraw() public payable {
      require(msg.sender == owner, "Pemanggil bukan owner");
      payable (owner).transfer(address(this).balance);
    }

}
