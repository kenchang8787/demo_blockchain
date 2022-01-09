
// SPDX-License-Identifier: MIT

pragma solidity ^0.8.10 <0.9.0;

// 映射
contract Mapping {
    // 地址 => 無符號整數
    mapping(address => uint) public myMap;

    function get(address _addr) public view returns (uint) {
        // 映射通常會回傳值, 但若此 key 未被設定, 則會回傳 default(T)
        return myMap[_addr];
    }

    function set(address _addr, uint _i) public {
        // 更新此 key 對應的 value
        myMap[_addr] = _i;
    }

    function remove(address _addr) public {
        // 將此 key 對應的 value 移除
        delete myMap[_addr];
    }
}