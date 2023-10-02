import * as dotenv from "dotenv"
import * as hre  from "hardhat";
dotenv.config();


async function main() {
  
  // here we deploy the contract
 const contract = await hre.ethers.deployContract("NaijaElection", [["APC", "PDP", "LP"]]);

  await contract.waitForDeployment();

 // print the address of the deployed contract
  console.log("NaijaElection Contract Address:", contract.target);

}
function sleep(ms: any) {
  return new Promise((resolve) => setTimeout(resolve, ms));
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});