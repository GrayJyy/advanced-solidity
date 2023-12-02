// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Proxy {
    address public implementation; // Logical contract address. The type of the state variable in the same location of the implementation contract must be the same as that in the Proxy contract, otherwise an error will be reported

    constructor(address _implementation) {
        implementation = _implementation;
    }

    receive() external payable {}

    fallback() external payable {
        address _impl = implementation;
        assembly {
            calldatacopy(0, 0, calldatasize()) // copy calldata to memory
            let result := delegatecall(gas(), _impl, 0, calldatasize(), 0, 0)
            returndatacopy(0, 0, returndatasize()) // copy return data to memory
            switch result
            case 0 { revert(0, returndatasize()) }
            default { return(0, returndatasize()) }
        }
    }
}
