// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

// 從本地資料夾引用 Foo.sol
import "./49_Foo.sol";

contract Import {
    // 初始化 Foo
    Foo public foo = new Foo();

    // 測試 Foo.sol 的功能
    function getFooName() public view returns (string memory) {
        return foo.name();
    }
}
