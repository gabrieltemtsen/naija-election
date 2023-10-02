# NaijaElection

NaijaElection is a Solidity smart contract that replicates the Nigerian system of voting. It allows the registration of parties for an election and enables voters to cast their votes for their preferred political parties.

## Overview

NaijaElection is a blockchain-based voting system deployed on SwissTronik testnet leveraging it's cutting-edge tech on privacy designed to emulate the Nigerian electoral process. It includes the following key components:

Parties: Parties participating in the election are registered with their names and start with zero votes.

Voters: Registered voters are assigned a permanent voter's card (PVC) represented by their Ethereum address.

INEC (Independent National Electoral Commission): INEC is the contract deployer and has the authority to register voters and oversee the election.

Voting: Registered voters can cast their votes for their preferred parties by specifying the party index.

### Deployed Contract Address on SwissTronik Testnet
* CA: 0xD4952785fa763C38196E5db7cfEDF17bd3112237


Flow:

```shell

Deploy the Contract: Deploy the NaijaElection contract, providing the names of the parties that will participate in the election in an Array.

Register Voters: INEC, the contract deployer, can register voters by specifying their Ethereum addresses. Each voter is assigned an initial vote count and a PVC.

Vote: Registered voters can use their PVCs to cast votes for their chosen parties by providing the party's index.

View Results: You can check the election results by calling the getAllVoteCounts function, which returns an array of parties with their respective vote counts.
```
