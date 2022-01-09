
// SPDX-License-Identifier: MIT

pragma solidity ^0.8.10 <0.9.0;

contract ViewAndPure {
    uint public x = 1;

    // view 方法不會變更 state 所儲存的值
    function addToX(uint y) public view returns (uint) {
        return x + y;
    }

    // pure 方法不會變更、讀取 state 所儲存的值
    function add(uint i, uint j) public pure returns (uint) {
        return i + j;
    }
}
