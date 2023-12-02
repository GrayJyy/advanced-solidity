// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Logic {
    address public implementation;
    uint256 public value;

    event CallSuccess();

    function add() public returns (uint256 _value) {
        _value = ++value;
        emit CallSuccess();
    }
}
