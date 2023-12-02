// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {HelperConfig} from "./HelperConfig.s.sol";
import {Proxy} from "../../src/Proxy/Proxy.sol";

contract DeployProxy is Script {
    constructor() {}

    function run() external returns (Proxy proxy, HelperConfig helperConfig) {
        helperConfig = new HelperConfig();
        (uint256 _deployerKey, address _implementation) = helperConfig.activeNetworkConfig();
        vm.startBroadcast(_deployerKey);
        proxy = new Proxy(_implementation);
        vm.stopBroadcast();
    }
}
