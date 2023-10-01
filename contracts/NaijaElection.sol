// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

// import "hardhat/console.sol";

contract NaijaElection {


    // Independent National Electoral Commision
    address private INEC;

    struct Voter {
        uint voteCount; // One Voter to One Vote == 1
        bool voted;     // if true, voter has voted
        uint voteIndex;  // index of the party to vote
        address pvc;     // permanent voters card- address or identity of the voter
    }



    struct Party {
        string name;
        uint256 votesCount;
    } 

    mapping(address => Voter) private voters;

    Party[] private parties;

       modifier OnlyINEC() {
        require(msg.sender == INEC, "Caller is not INEC, Seems You wanna snatch the ballot");
        _;
    }
     modifier OnlyVoter() {
       require(voters[msg.sender].pvc != address(0), 'Only Voters can vote');
        _;
    }

    constructor(string[] memory partyNames) {
        INEC = msg.sender;
        
        for(uint i = 0; i < partyNames.length; i++) {
            parties.push(Party({
                name: partyNames[i],
                votesCount: 0
            }));
        }
    }
      function registerVoter(address _voter) public OnlyINEC  {
       require(voters[_voter].pvc == address(0), 'Voter has already registered!');
       require(!voters[_voter].voted, "Voter has already voted");

       voters[_voter] = Voter({
        voteCount: 0,
        voted: false,
        voteIndex: 0,
        pvc: _voter
       });
    }

    function vote (uint _voteIndex) public  OnlyVoter {
         require(!voters[msg.sender].voted, "Voter has already voted");
        require(voters[msg.sender].voteCount > 0, "No votes left for this voter");
        require(_voteIndex < parties.length, "Invalid party index");

        voters[msg.sender].voted = true;
        voters[msg.sender].voteCount--;
        voters[msg.sender].voteIndex = _voteIndex;

        parties[_voteIndex].votesCount++;

    }
}  