pragma solidity ^0.4.11;

contract Election {
  //Model a Candidate
  struct Candidate {
    uint id;
    string name;
    uint voteCount;
  }
  //Store accounts that have voted
  mapping(address => bool) public voters;
  //Store candidate
  //Fetch candidate
  //Store using a mapping that takes and unsigned int and Candidate Struct
  mapping(uint => Candidate) public candidates;
  
  //Store candidate count
  uint public candidatesCount;

  function Election () public {
    addCandidate("Kareem");
    addCandidate("John");
  }

  function addCandidate (string _name) private {
    candidatesCount ++;
    candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
  }
  
  function vote (uint _candidateId) public {
    //require that they haven't voted before
    require(!voters[msg.sender]);

    //require a valid candidate
    require(_candidateId > 0 && _candidateId <= candidatesCount);

    //record that voter has voted
    voters[msg.sender] = true;
    
    //update candidate vote count
    candidates[_candidateId].voteCount ++;
  }

}