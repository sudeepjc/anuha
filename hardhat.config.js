require("@nomicfoundation/hardhat-toolbox");

module.exports = {
  solidity: {
    version: '0.8.19',
    settings: {
        optimizer: {
            enabled: true,
            runs: 1000,
        },
    },
  },
};
