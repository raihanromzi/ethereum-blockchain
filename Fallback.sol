// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

/*
        Ether sent to contract
                |
          msg.data empty ?
               / \
             yes  no
            /      \
receive() exists?   fallback()
          / \
        yes  no
        /     \
  receive()  fallback()
*/

contract Fallback {
    // event Log(string func, address sender, uint value, bytes data);
    event Log(string func, uint value);

    // Fallback function must be declared as external.
    fallback() external payable {
        // send / transfer (forwards 2300 gas to this fallback function)
        // call (forwards all of the gas)
        // emit Log("fallback", msg.sender, msg.value, msg.data);
        emit Log("fallback", gasleft());
    }

    // Receive is a variant of fallback that is triggered when msg.data is empty
    receive() external payable {
        // emit Log("receive", msg.sender, msg.value, "");
        emit Log("receive", gasleft());
    }

    // receive() external payable {}
    // fallback() external payable {}

    // Helper function to check the balance of this contract
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}

contract SendToFallback {

    function transferToFallback(address payable _to) public payable {
        _to.transfer(msg.value);
    }

    function callFallback(address payable _to) public payable {
        (bool sent, ) = _to.call{value: msg.value}("");
        require(sent, "Failed to send Ether");
    }

    function callFallbackData(address payable _to, bytes calldata data) public payable {
        (bool sent, ) = _to.call{value: msg.value}(data);
        require(sent, "Failed to send Ether");
    }
}
