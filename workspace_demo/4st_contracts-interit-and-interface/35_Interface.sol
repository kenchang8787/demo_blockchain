
// SPDX-License-Identifier: MIT

pragma solidity ^0.8.10 <0.9.0;

// 基底合約 Counter (符合 ICounter)
contract Counter {
    uint public count;

    function increment() external {
        count += 1;
    }
}

// 宣告介面 ICounter
interface ICounter {
    function count() external view returns (uint);

    function increment() external;
}

contract MyContract {
    // 將 Counter 合約的 address 帶入, 即可用宣告的介面使用 Counter 合約方法 
    function incrementCounter(address _counter) external {
        ICounter(_counter).increment();
    }

    function getCount(address _counter) external view returns (uint) {
        return ICounter(_counter).count();
    }
}

// Uniswap example
interface UniswapV2Factory {
    function getPair(address tokenA, address tokenB)
        external
        view
        returns (address pair);
}

interface UniswapV2Pair {
    function getReserves()
        external
        view
        returns (
            uint112 reserve0,
            uint112 reserve1,
            uint32 blockTimestampLast
        );
}

// 將鏈上的合約以 Interface 的方式使用
contract UniswapExample {
    address private factory = 0x5C69bEe701ef814a2B6a3EDD4B1652CB9cc5aA6f;
    address private dai = 0x6B175474E89094C44Da98b954EedeAC495271d0F;
    address private weth = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;

    function getTokenReserves() external view returns (uint, uint) {
        address pair = UniswapV2Factory(factory).getPair(dai, weth);
        (uint reserve0, uint reserve1, ) = UniswapV2Pair(pair).getReserves();
        return (reserve0, reserve1);
    }
}
