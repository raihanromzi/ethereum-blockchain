// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract myEnum {

    enum freshJuiceSize{ SMALL, MEDIUM, LARGE }

    freshJuiceSize public pilihan;

    freshJuiceSize public defaultPilihan = freshJuiceSize.MEDIUM;

    function setSmall() public {
        pilihan = freshJuiceSize.SMALL;
    }

    function setMedium() public {
        pilihan = freshJuiceSize.MEDIUM;
    }

    function setLarge() public {
        pilihan = freshJuiceSize.LARGE;
    }


}
