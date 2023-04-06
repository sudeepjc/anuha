const { expect } = require("chai");
const { ethers } = require('hardhat');

describe("Gas-Golfing-2: VairablePacking", function () {
  let deployer;

  before(async function () {
    
    // Contracts are deployed using the first signer/account by default
     [deployer] = await ethers.getSigners();

    const PackingInStructs_Factory = await ethers.getContractFactory("PackingInStructs");
    this.packingInStructs = await PackingInStructs_Factory.deploy();
    await this.packingInStructs.deployed();

  });

  describe("Compare and Log", function () {
    it("Gas cost of reading packed vs not packed structs", async function () {

      const notPackedUnits = await this.packingInStructs.estimateGas.readVariablesNotPacked();
      console.log(` Reading Not Packed struct: ${notPackedUnits} gas uints`);

      const packedUnits = await this.packingInStructs.estimateGas.readVariablesPacked();
      console.log(` Reading Packed struct: ${packedUnits} gas units`);

      expect(packedUnits).lt(notPackedUnits);
    });
  });
});
