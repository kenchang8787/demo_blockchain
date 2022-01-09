// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

// 汽車合約
contract Car {
    address public owner;
    string public model;
    address public carAddr;

    // 建構函式
    constructor(address _owner, string memory _model) payable {
        owner = _owner;
        model = _model;
        carAddr = address(this);
    }
}

// 汽車工廠合約
contract CarFactory {
    Car[] public cars;

    // 生產新汽車
    function create(address _owner, string memory _model) public {
        Car car = new Car(_owner, _model);
        cars.push(car);
    }

    // 生產新汽車並贈送乙太幣
    function createAndSendEther(address _owner, string memory _model) public payable {
        Car car = (new Car){value: msg.value}(_owner, _model);
        cars.push(car);
    }

    // 生產新汽車(2)
    function create2(
        address _owner,
        string memory _model,
        bytes32 _salt
    ) public {
        // 透過輸入 salt 來預測其佈署的地址
        Car car = (new Car){salt: _salt}(_owner, _model);
        cars.push(car);
    }

    // 生產新汽車並贈送乙太幣(2)
    function create2AndSendEther(
        address _owner,
        string memory _model,
        bytes32 _salt
    ) public payable {
        Car car = (new Car){value: msg.value, salt: _salt}(_owner, _model);
        cars.push(car);
    }

    // 取得汽車
    function getCar(uint _index)
        public
        view
        returns (
            address owner,
            string memory model,
            address carAddr,
            uint balance
        )
    {
        Car car = cars[_index];

        return (car.owner(), car.model(), car.carAddr(), address(car).balance);
    }
}
