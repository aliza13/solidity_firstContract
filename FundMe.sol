//SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract FundMe {

    uint256 public minimumUsd = 50 * 1e18;

    function fund() public payable{
        // 1e18 = 1*10 ** 18 == 1000000000000000000
        // require(msg.value >= 1e18, "Did not deploy enough."); 
        require(msg.value >= minimumUsd, "Did not deploy enough."); 
    }

    function getPrice() public view returns(uint256) {
        // addy 0x5f4eC3Df9cbd43714FE2740f5E3616155c5b8419
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x5f4eC3Df9cbd43714FE2740f5E3616155c5b8419);
        (,int256 answer,,,) = priceFeed.latestRoundData();
        // price of ETH in USD
        return uint256(answer * 1e10); // cuz only 8 decimals, need 18
    }

    function getConversionRate(uint256 ethAmount) public view returns (uint256) {
        uint256 ethPrice = getPrice();
        // MULTIPLE FIRST then divide
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18;
        return ethAmountInUsd;
    }

   // function withdraw() {}

}