// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Base {

    INFO public _INFO;

    constructor(string memory name) {
        _INFO.Name = name;
        _INFO.Creator = msg.sender;
    }

}

struct INFO {
    string Name;
    address Creator;
}