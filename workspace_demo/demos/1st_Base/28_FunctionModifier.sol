
// SPDX-License-Identifier: MIT

pragma solidity ^0.8.10 <0.9.0;

contract FunctionModifier {
    address public owner;
    uint public x = 10;
    bool public locked;

    constructor() {
        // 建構時, 設定發出交易人為 owner
        owner = msg.sender;
    }

    // 檢查發送交易人是否為合約擁有者
    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        // 下底線是一個特殊字符, 他只能存在於方法修飾詞內部
        // 它告訴 Solidity 繼續執行之後的代碼
        _;
    }

    // 方法修飾詞可以接收輸入
    // 檢查傳入的 address 是否為零值
    modifier validAddress(address _addr) {
        require(_addr != address(0), "Not valid address");
        _;
    }

    // 此方法執行時會做 onlyOwner、validAddress 的驗證
    function changeOwner(address _newOwner) public onlyOwner validAddress(_newOwner) {
        owner = _newOwner;
    }

    // 方法修飾詞可以在方法執行前和後執行
    // 此方法修飾詞避免了當方法仍在執行時, 又重複被呼叫
    modifier noReentrancy() {
        require(!locked, "No reentrancy");

        locked = true;
        _;
        locked = false;
    }

    // 此例一定會造成重入
    function decrement(uint i) public noReentrancy {
        x -= i;

        if (i > 1) {
            decrement(i - 1);
        }
    }
}
