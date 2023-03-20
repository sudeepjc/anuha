const { expect } = require("chai");
const { ethers } = require('hardhat');

describe("Gas-Golfing-1: uint8 vs uint256", function () {
  let deployer;

  before(async function () {
    
    // Contracts are deployed using the first signer/account by default
     [deployer] = await ethers.getSigners();

    const Sample_UINT8_Factory = await ethers.getContractFactory("SampleUINT8");
    this.sampleUint8 = await Sample_UINT8_Factory.deploy();
    await this.sampleUint8.deployed();

    const Sample_UINT256_Factory = await ethers.getContractFactory("SampleUINT256");
    this.sampleUint256 = await Sample_UINT256_Factory.deploy();
    await this.sampleUint256.deployed();

  });

  describe("Compare and Log", function () {
    it("Gas cost of executing uint256 version is less than uint8", async function () {

      const uint8GasCost = await this.sampleUint8.estimateGas.someFunction();
      console.log(` uint8 version of reentrancy: ${uint8GasCost} gas uints`);

      const uint256GasCost = await this.sampleUint256.estimateGas.someFunction();
      console.log(` uint256 version of reentrancy: ${uint256GasCost} gas units`);

      expect(uint256GasCost).lt(uint8GasCost);
    });
  });
});
