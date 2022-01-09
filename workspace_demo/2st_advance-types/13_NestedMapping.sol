
// SPDX-License-Identifier: MIT

pragma solidity ^0.8.10 <0.9.0;

// 巢狀結構的映射
contract NestedMapping {
    // 地址 => (無符號整數 => 布林)
    mapping(address => mapping(uint => bool)) public nested;

    function get(address _addr1, uint _i) public view returns (bool) {
        // 巢狀結構的映射若未被設定, 一樣會回傳 default(T)
        // 此例中會回傳 default(bool) = false
        return nested[_addr1][_i];
    }

    function set(
        address _addr1,
        uint _i,
        bool _boo
    ) public {
        nested[_addr1][_i] = _boo;
    }

    function remove(address _addr1, uint _i) public {
        delete nested[_addr1][_i];
    }
}