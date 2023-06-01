// SPDX-License-Identifier: MIT
pragma solidity 0.8;

contract SendEther {
    // Mengirim amount ada 3:
    // 1. transfer
    // 2. send
    // 3. call

    function sendViaTransfer(address payable _to) public payable {
        // This function is no longer recommended for sending Ether.
        _to.transfer(msg.value);
    }

    function sendViaSend(address payable _to) public payable {
        // Send returns a boolean value indicating success or failure.
        // This function is not recommended for sending Ether.
        // Tidak bisa menambahkan berapa ether yang dikirim
        bool sent = _to.send(msg.value);
        require(sent, "Failed to send Ether");
    }

    function sendViaCall(address payable _to) public payable {
        // Call returns a boolean value indicating success or failure.
        // This is the current recommended method to use.
        // (bool sent, bytes memory data) = _to.call{value: msg.value}("");
        (bool sent, /*bytes memory data*/) = _to.call{value: msg.value}("");
        require(sent, "Failed to send Ether");
    }

    function CheckBalance(address _to) public view returns (uint)
    {
        return _to.balance;
    }

}
