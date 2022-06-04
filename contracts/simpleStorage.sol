// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8; // most current: 0.8.12

contract SimpleStorage {
    uint256 public favoriteNum; // = 0 (null)
    // People public person = People({favoriteNum: 2, name: "Aliza"});
    mapping(string => uint256) public nameToFavNum;

    struct People {
        // index 0
        uint256 favoriteNum;
        string name;
    }
    People[] public people; 

    function store(uint256 _favoriteNum) public {
        favoriteNum = _favoriteNum;
    }

    function retrieve() public view returns(uint256){
        // cant update view funcs... just viewing no gas unless contract is called 
        // and view func is in a func that costs gas
        return favoriteNum;
    }
    function addPerson(string memory _name, uint256 _favoriteNum) public {
        people.push(People(_favoriteNum, _name));
        // finds fav num without having to iterate thru
        nameToFavNum[_name] = _favoriteNum;
    }
}