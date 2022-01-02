
// SPDX-License-Identifier: MIT

pragma solidity ^0.8.10 <0.9.0;

contract A {
    string public name = "Contract A";

    function getName() public view returns (string memory) {
        return name;
    }
}

contract C is A {
    // 利用建構函式來達到覆寫 inherited state 的目的
    constructor() {
        name = "Contract C";
    }

    // C.getName returns "Contract C"
}
