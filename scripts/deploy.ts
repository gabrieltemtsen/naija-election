import * as dotenv from "dotenv"
import * as hre  from "hardhat";
dotenv.config();

const initialSupply = 100

async function main() {
  
  // here we deploy the contract
 const BarnexTokenContract = await hre.ethers.deployContract("NaijaElection", [initialSupply]);

  await BarnexTokenContract.waitForDeployment();

 // print the address of the deployed contract
  console.log("NaijaElection Contract Address:", BarnexTokenContract.target);

//0x1148120c28a9597Efe77BaaE01989129406966A0
}
function sleep(ms: any) {
  return new Promise((resolve) => setTimeout(resolve, ms));
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});