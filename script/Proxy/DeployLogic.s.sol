// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {HelperConfig} from "./HelperConfig.s.sol";
import {Logic} from "../../src/Proxy/Logic.sol";

contract DeployLogic is Script {
    constructor() {}

    function run() external returns (Logic logic, HelperConfig helperConfig) {
        helperConfig = new HelperConfig();
        (uint256 deployKey,) = helperConfig.activeNetworkConfig();

        vm.startBroadcast(deployKey);
        logic = new Logic();
        vm.stopBroadcast();
    }
}
