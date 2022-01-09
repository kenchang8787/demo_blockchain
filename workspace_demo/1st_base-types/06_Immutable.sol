
// SPDX-License-Identifier: MIT

pragma solidity ^0.8.10 <0.9.0;

contract Immutable {
    // 不可變變量通常以大寫命名
    address public immutable MY_ADDRESS;
    uint public immutable MY_UINT;

    constructor(uint _myUint) {
        MY_ADDRESS = msg.sender;
        MY_UINT = _myUint;
    }
}
