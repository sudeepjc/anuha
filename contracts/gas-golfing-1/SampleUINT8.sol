// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.19;

import "./ReentrancyGuardUINT8.sol";

contract SampleUINT8 is ReentrancyGuardUINT8 {
    function someFunction() external nonReentrant {
        //Does nothing
    }
}
