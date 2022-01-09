
// SPDX-License-Identifier: MIT

pragma solidity ^0.8.10 <0.9.0;

contract Account {
    uint public balance;
    uint public constant MAX_UINT = 2**256 - 1;

    // 存款
    function deposit(uint _amount) public {
        uint oldBalance = balance;
        uint newBalance = balance + _amount;

        // 要求 存款後的金額 >= 原金額
        require(newBalance >= oldBalance, "Overflow");

        balance = newBalance;

        // 斷言 存款後的餘額 >= 舊餘額
        assert(balance >= oldBalance);
    }

    // 提款
    function withdraw(uint _amount) public {
        uint oldBalance = balance;

        // 要求 餘額 >= 提款的金額
        require(balance >= _amount, "Underflow");

        // 若餘額小於提款金額, 則失敗
        if (balance < _amount) {
            revert("Underflow");
        }

        balance -= _amount;

        // 斷言 提款後的餘額 <= 提款前的餘額
        assert(balance <= oldBalance);
    }
}
