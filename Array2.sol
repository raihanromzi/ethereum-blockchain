// SPDX-License-Identifier: MIT
pragma solidity 0.8;


contract ArrayPushPop {
   uint[] public ValueDynamic = [100, 200, 300, 400, 500];

   function pushArray (uint num) public {
        ValueDynamic.push(num);
   }

   function popArray() public {
        ValueDynamic.pop();
   }

   function lenghtArray() public view returns (uint)
   {
        return ValueDynamic.length;
   }

   function getLastArray() public view returns (uint) {
        uint lastArr = ValueDynamic.length-1;
        return ValueDynamic[lastArr];
   }

    function deleteArray(uint index) external {
        if (index >= ValueDynamic.length) return;

        for (uint i = index; i<ValueDynamic.length-1; i++){
            ValueDynamic[i] = ValueDynamic[i+1];
        }
        ValueDynamic.pop();
    }

}
