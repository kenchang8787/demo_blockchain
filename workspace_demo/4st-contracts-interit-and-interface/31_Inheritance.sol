
// SPDX-License-Identifier: MIT

pragma solidity ^0.8.10 <0.9.0;

/*
範例繼承圖
    A
   / \
  B   C
 / \ /
F  D,E
*/

// 合約A, 最底層的合約
contract A {
    function foo() public pure virtual returns (string memory) {
        return "A";
    }
}

// 繼承合約時, 使用關鍵字 is
// 合約B, 繼承自A
contract B is A {
    // 覆寫(override) A.foo()
    function foo() public pure virtual override returns (string memory) {
        return "B";
    }
}

// 合約C, 繼承自A
contract C is A {
    // 覆寫(override) A.foo()
    function foo() public pure virtual override returns (string memory) {
        return "C";
    }
}

// 合約可以繼承自多個父輩, 當同一個方法被不同的父合約所定義(覆寫)時，
// 會從繼承時的順序 由右至左 並且 深度優先 的順序
// 合約D, 繼承自 B, C, 此例中 D.foo() 回傳 "C"
contract D is B, C {
    function foo() public pure override(B, C) returns (string memory) {
        return super.foo();
    }
}

// 合約E, 繼承自 C, B, 此例中 E.foo() 回傳 "B"
contract E is C, B {
    function foo() public pure override(C, B) returns (string memory) {
        return super.foo();
    }
}

// 繼承必須從 "最基礎" 排序至 "最衍生" 的順序宣告
// F 繼承 A, B, 此例中若將 A, B 交換會發生編譯錯誤
contract F is A, B {
    function foo() public pure override(A, B) returns (string memory) {
        return super.foo();
    }
}
