
// SPDX-License-Identifier: MIT

pragma solidity ^0.8.10 <0.9.0;

// 宣告物流狀態
enum Status {
    Pending,
    Shipped,
    Accepted,
    Rejected,
    Canceled
}
