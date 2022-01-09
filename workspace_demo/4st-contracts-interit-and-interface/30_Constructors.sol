
// SPDX-License-Identifier: MIT

pragma solidity ^0.8.10 <0.9.0;

contract X {
    string public name;
    // 建構時 X 合約時, 將 name 賦值
    constructor(string memory _name) {
        name = _name;
    }
}

contract Y {
    string public text;
    // 建構 Y 合約時, 將 text 賦值
    constructor(string memory _text) {
        text = _text;
    }
}

// 合約B, 繼承自 合約X 與 合約Y, 並於宣告時, 傳值給 X 與 Y 的建構函式
contract B is X("Input to X"), Y("Input to Y") {

}

// 合約C, 繼承自 合約X 與 合約Y, 並宣告其建構函式, 傳值給 X 與 Y 的建構函式
contract C is X, Y {
    constructor(string memory _name, string memory _text) X(_name) Y(_text) {}
}

// 父輩的建構函式會依照繼承的順序調用, 不論其在子輩的建構函式列表中順序為何
// 下列合約中建構函式的調用順序為 Y > X > D
contract D is X, Y {
    constructor() X("X was called") Y("Y was called") {}
}

// 下列合約中建構函式的調用順序為 Y > X > E
contract E is X, Y {
    constructor() Y("Y was called") X("X was called") {}
}
