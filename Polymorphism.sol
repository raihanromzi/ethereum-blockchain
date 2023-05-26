// SPDX-License-Identifier: MIT
pragma solidity 0.8;

contract myPolymorphism {

    function getSum(uint _x, uint _y) public pure returns(uint) {
        return _x + _y;
    }

    function getSum(uint _x, uint _y, uint _z) public pure returns(uint) {
        return _x + _y + _z;
    }

    function callArgument() public pure returns(uint) {
        // return getSum(2,3);
        return getSum(2,3,5);
    }

}


contract parentPolymorphism {
    uint sum;

    function setValue(uint _num1, uint _num2) public {
        sum = _num1 + _num2;
    }

    function getValue()  view virtual public returns (uint) {
        // return sum;
        return 111;
    }
}

contract childPolymorphism is parentPolymorphism {

    function getValue() public view override returns (uint) {
        return sum;
    }

    function getInfo() public pure returns (string memory) {
        return "Ini adalah childPolymorphism";
    }


}
