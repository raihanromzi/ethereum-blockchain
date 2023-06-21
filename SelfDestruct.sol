// SPDX-License-Identifier: MIT
pragma solidity ^0.8;


contract selfDestructContract
{
    string public messages;

    // Harus ada
    receive() external payable {}
    fallback() external payable {}


    function getBalance() public view returns (uint)  {
        return address(this).balance;
    }


    function sendViaTransfer(address payable _to)  public payable
    {
        _to.transfer(msg.value);
    }


    function setmsg(string memory _msg) public
    {
        messages = _msg;
    }


    function destroy() public
    {
        // Gas nya itu 5000 GAS
        // Uang di smartcontract selfdestruct akan pindah ke yg execute
        // sebaiknya hrs ada validasi only owner modifier
        address payable addr = payable(address(msg.sender));
        selfdestruct(addr);
    }
}
