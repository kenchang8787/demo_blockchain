
// SPDX-License-Identifier: MIT

pragma solidity ^0.8.10 <0.9.0;

contract Counter {
    
    uint public counter;

    function increase() public {
        counter += 1;
    }

    function decrease() public {
        if (counter == 0)
            return;

        counter -= 1;
    }
}