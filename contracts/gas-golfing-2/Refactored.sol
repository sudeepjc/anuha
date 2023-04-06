// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract Refactored {
    uint256 smallNum = 21; // Occupies Slot 0 of Storage
    uint256 anotherSmallNumber = 22; // Occupies Slot 0 of Storage
    uint256 bigNum = 12134567890; // Occupies Slot 1 of Storage

    // 2324 gas (Cost only applies when called by a contract)
    function readSmallNum() public view returns (uint256) {
        return smallNum;
    }

    // 2280gas (Cost only applies when called by a contract)
    function readAnotherSmallNum() public view returns (uint256) {
        return anotherSmallNumber;
    }

    // 2247 gas (Cost only applies when called by a contract)
    function readBigNum() public view returns (uint256) {
        return bigNum;
    }

    // Input 0: 0x0000000000000000000000000000000000000000000000000000000000000015
    // Input 1: 0x0000000000000000000000000000000000000000000000000000000000000016
    // Input 2: 0x00000000000000000000000000000000000000000000000000000002d346cfd2
    function getValueAtSlot(uint256 slotNum) public view returns (bytes32) {
        bytes32 value;
        assembly {
            value := sload(slotNum)
        }
        return value;
    }
}
