// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract VariablePacking {
    uint8 smallNum = 21; // Occupies Slot 0 of Storage
    uint8 anotherSmallNum = 22; // Occupies Slot 0 of Storage
    uint256 bigNum = 12134567890; // Occupies Slot 1 of Storage

    // 2351 gas (Cost only applies when called by a contract)
    function readSmallNum() public view returns (uint8) {
        return smallNum;
    }

    // 2307gas (Cost only applies when called by a contract)
    function readAnotherSmallNum() public view returns (uint8) {
        return anotherSmallNum;
    }

    // 2248 gas (Cost only applies when called by a contract)
    function readBigNum() public view returns (uint256) {
        return bigNum;
    }

    // Input 0: 0x0000000000000000000000000000000000000000000000000000000000001615
    // Input 1: 0x00000000000000000000000000000000000000000000000000000002d346cfd2
    function getValueAtSlot(uint256 slotNum) public view returns (bytes32) {
        bytes32 value;
        assembly {
            value := sload(slotNum)
        }
        return value;
    }
}
