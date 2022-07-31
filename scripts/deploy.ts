import { ethers } from "hardhat";

async function main() {
  const Feature1 = await ethers.getContractFactory("Feature1");
  const feature1 = await Feature1.deploy();
  await feature1.deployed();
  console.log("Feature1 deployed to:", feature1.address);

  const Proof1 = await ethers.getContractFactory("Proof1");
  const proof1 = await Proof1.deploy();
  await proof1.deployed();
  console.log("Proof1 deployed to:", proof1.address);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
