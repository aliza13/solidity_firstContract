// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;


// parent contract
import "./simpleStorage.sol";


// inheritance with is keyword
contract extraStorage is SimpleStorage {
    // overriding functions... virtual & override
    function store(uint256 _favoriteNum) public override {
        favoriteNum = _favoriteNum + 5;
    }

}