
// SPDX-License-Identifier: MIT

pragma solidity ^0.8.10 <0.9.0;

// 導入列舉宣告
import "./18_EnumDeclaration.sol";

contract Enum {
    Status public status;

    function set(Status sta) public {
        status = sta;
    }
}
