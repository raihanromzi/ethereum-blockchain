// SPDX-License-Identifier: MIT
pragma solidity ^0.8;
contract timeFunction {

    //convert epoch to human date = https://www.epochconverter.com/

    // "now" has been deprecated. Use "block.timestamp" instead.
    // uint public timeNow = now;

    // 1 == 1 seconds
    // 1 minutes == 60 seconds
    // 1 hours == 60 minutes
    // 1 days == 24 hours
    // 1 weeks == 7 days

    uint public timeNow = block.timestamp;

    // Unix Time (Epoch)
    // Setiap blockchain menggunakan Epoch -> Linux
    uint startDate = 1672531200; // 2023-01-01 00:00:00
    uint endDate = 1673481600; // 2023-02-12 00:00:00

    uint public dayDiff = (endDate - startDate) / 60 / 60 / 24;
    uint public hourDiff = (endDate - startDate) / 60 / 60;

    uint public reduced30 = block.timestamp - 30 days;

    // Tertinggi itu weeks, kemudian days, hours, minutes, seconds
    uint public later = timeNow + 1 days;
    uint public before = timeNow - 3 days;
    uint public prevWeek = timeNow - 1 weeks;

   // uint public nextYear = timeNow + 1 years; depcreated
   uint public nextYear = timeNow + 360 days;
}
