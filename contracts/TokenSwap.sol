// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import { IERC20 } from "./interfaces/IERC20.sol";

contract FixedRateTokenSwap {
    IERC20 public tokenA;
    IERC20 public tokenB;

    uint public rate = 3;

    constructor(address _tokenA, address _tokenB) {
        tokenA = IERC20(_tokenA);
        tokenB = IERC20(_tokenB);
    }

    function swapAToB(uint amountA) external {
        uint amountB = amountA * rate;

        require(tokenA.transferFrom(msg.sender, address(this), amountA), "TokenA transfer failed");
        require(tokenB.balanceOf(address(this)) >= amountB, "Not enough TokenB in contract");

        require(tokenB.transfer(msg.sender, amountB), "TokenB transfer failed");
    }

    function swapBToA(uint amountB) external {
        uint amountA = amountB / rate;

        require(tokenB.transferFrom(msg.sender, address(this), amountB), "TokenB transfer failed");
        require(tokenA.balanceOf(address(this)) >= amountA, "Not enough TokenA in contract");

        require(tokenA.transfer(msg.sender, amountA), "TokenA transfer failed");
    }

    function addLiquidity(uint amountA, uint amountB) external {
        require(tokenA.transferFrom(msg.sender, address(this), amountA), "TokenA transfer failed");
        require(tokenB.transferFrom(msg.sender, address(this), amountB), "TokenB transfer failed");
    }

    function withdrawLiquidity(uint amountA, uint amountB) external {
        require(tokenA.balanceOf(address(this)) >= amountA, "Not enough TokenA");
        require(tokenB.balanceOf(address(this)) >= amountB, "Not enough TokenB");

        require(tokenA.transfer(msg.sender, amountA), "TokenA withdraw failed");
        require(tokenB.transfer(msg.sender, amountB), "TokenB withdraw failed");
    }
}
