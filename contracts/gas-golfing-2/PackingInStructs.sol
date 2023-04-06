// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract PackingInStructs {
    struct VariablesNotPacked {
        address myAddress;
        uint256 myage;
        bool areYouHappy;
    }

    struct VariablesPacked {
        bool areYouHappy;
        uint8 myage;
        address myAddress;
    }

    VariablesNotPacked a;
    VariablesPacked b;

    constructor() {
        a = VariablesNotPacked(msg.sender, 36, false);
        b = VariablesPacked(true, 36, msg.sender);
    }

    // 6774 gas (Cost only applies when called by a contract)
    function readVariablesNotPacked()
        public
        view
        returns (VariablesNotPacked memory)
    {
        return a;
    }

    // 2550 gas (Cost only applies when called by a contract)
    function readVariablesPacked()
        public
        view
        returns (VariablesPacked memory)
    {
        return b;
    }

    // Input 0: 0x0000000000000000000000005b38da6a701c568545dcfcb03fcb875f56beddc4  - a.myAddress
    // Input 1: 0x0000000000000000000000000000000000000000000000000000000000000024  - a.age
    // Input 2: 0x0000000000000000000000000000000000000000000000000000000000000000  - a.areYouHappy
    // Input 3: 0x00000000000000000000|5b38da6a701c568545dcfcb03fcb875f56beddc4|24|01|
    //            - | b.myAddress | b.age | b.areYouHappy|
    function getValueAtSlot(uint256 slotNum) public view returns (bytes32) {
        bytes32 value;
        assembly {
            value := sload(slotNum)
        }
        return value;
    }
}
