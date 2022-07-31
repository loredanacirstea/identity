import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";
const PRIVATE_KEY = process.env.PRIVATE_KEY;

const config: HardhatUserConfig = {
  solidity: "0.8.9",
  networks: {
    mythos: {
      url: "https://mythos-evm.provable.dev",
      accounts: [`0x${PRIVATE_KEY}`]
    },
  }
};

export default config;

