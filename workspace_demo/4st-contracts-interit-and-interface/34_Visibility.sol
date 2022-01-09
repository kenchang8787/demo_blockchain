
// SPDX-License-Identifier: MIT

pragma solidity ^0.8.10 <0.9.0;

contract Base {
    // Private 私有方法只有合約內的方法可以調用, 即使是子輩也不能調用
    function privateFunc() private pure returns (string memory) {
        return "private function called";
    }

    function testPrivateFunc() public pure returns (string memory) {
        return privateFunc();
    }

    // Internal 內部方法可以被合約內的方法調用, 也可以被子輩調用
    function internalFunc() internal pure returns (string memory) {
        return "internal function called";
    }

    function testInternalFunc() public pure virtual returns (string memory) {
        return internalFunc();
    }

    // Public 公有方法可以被合約內調用, 也可以被子輩調用, 也可以被外部任何合約或帳戶調用
    function publicFunc() public pure returns (string memory) {
        return "public function called";
    }

    // External 外部方法只能被外部合約或帳戶調用
    function externalFunc() external pure returns (string memory) {
        return "external function called";
    }

    // 此方法無法被編譯, 因為我們試圖在合約內調用外部方法
    // function testExternalFunc() public pure returns (string memory) {
    //     return externalFunc();
    // }

    // 區域變數
    string private privateVar = "my private variable";
    string internal internalVar = "my internal variable";
    string public publicVar = "my public variable";

    // 區域變數無法被聲明為 External, 故下面這行無法被編譯
    // string external externalVar = "my external variable";
}

contract Child is Base {
    // 子輩合約無法調用私有方法, 和私有區域變數
    // function testPrivateFunc() public pure returns (string memory) {
    //     return privateFunc();
    // }

    // 子輩合約可以調用內部方法和內部區域變數
    function testInternalFunc() public pure override returns (string memory) {
        return internalFunc();
    }
}
