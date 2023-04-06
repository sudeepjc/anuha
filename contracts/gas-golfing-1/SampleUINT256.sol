// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.19;

import "@openzeppelin/contracts/security/ReentrancyGuard.sol";

contract SampleUINT256 is ReentrancyGuard {
    function someFunction() external nonReentrant {
        //Does nothing
    }
}
