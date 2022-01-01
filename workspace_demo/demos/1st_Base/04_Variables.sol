
// SPDX-License-Identifier: MIT

pragma solidity ^0.8.10 <0.9.0;

// 變量類型
contract Variables {
    // State
    string public text = "Hello";
    uint public num = 123;

    function foo() public pure{
        // local
        uint i = 77;

        // global
        uint timestamp = block.timestamp;
        address sender = msg.sender;
    }
}