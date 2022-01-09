
// SPDX-License-Identifier: MIT

pragma solidity ^0.8.10 <0.9.0;

contract Loop {
    function loop() public pure {
        // For 迴圈
        for (uint i = 0; i < 10; i++) {
            if (i == 3) {
                continue;
            }
            if (i == 5) {
                break;
            }
        }

        // While 迴圈
        uint j;
        while (j < 10) {
            j++;
        }
    }
}