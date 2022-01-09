
// SPDX-License-Identifier: MIT

pragma solidity ^0.8.10 <0.9.0;

contract Gas {
    uint public i = 0;

    function forever() public {
        // 進行一個永久的循環, 會造成手續費(gas)用盡, 導致交易失敗
        // 並還原所有區域變數 (state) 的變更
        while (true) {
            i += 1;
        }
    }
}