// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract Callee {
    uint public x;
    uint public value;

    function setX(uint _x) public returns (uint) {
        x = _x;
        return x;
    }

    function setXandSendEther(uint _x) public payable returns (uint, uint) {
        x = _x;
        value = msg.value;

        return (x, value);
    }
}

contract Caller {
    // 直接調用 Callee 合約的函數
    function setX(Callee _callee, uint _x) public {
        uint x = _callee.setX(_x);
    }

    // 將 Callee 合約透過地址直接實體化, 在使用其函數
    function setXFromAddress(address _addr, uint _x) public {
        Callee callee = Callee(_addr);
        callee.setX(_x);
    }

    // 直接調用 Callee 合約的付款功能
    function setXandSendEther(Callee _callee, uint _x) public payable {
        (uint x, uint value) = _callee.setXandSendEther{value: msg.value}(_x);
    }
}
