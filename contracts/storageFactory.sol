// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./simpleStorage.sol";

contract StorageFactory {
    SimpleStorage[] public simpleStorageArray;

    function createSimpleStorageContract() public {
        // new keyword = deploying a new (but already coded) contract in this contract
        SimpleStorage simpleStorage = new SimpleStorage();
        // push indexes the next var and stores it to array
        simpleStorageArray.push(simpleStorage);
    }

    function sfStore(uint256 _simpleStorageIndex, uint256 _simpleStorageNumber) public {
        simpleStorageArray[_simpleStorageIndex].store(_simpleStorageNumber);
    }

    function sfGet(uint256 _simpleStorageIndex) public view returns (uint256) {
        simpleStorageArray[_simpleStorageIndex].retrieve;
    }
}