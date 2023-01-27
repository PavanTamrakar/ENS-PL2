// SPDX-Licence-Identifier: UNLICENCED 

pragma solidity ^0.8.10;

import "hardhat/console.sol";

contract Domains {
    constructor(){
        console.log("My Polygon L2 ENS");
    }

    mapping(string => address) public domains;

    mapping(string => string) public records;

    function register(string calldata name) public {
        require(domains[name] == address(0));
        domains[name] = msg.sender;
    }

    function getAddress(string calldata name) public view returns(address) {
        return domains[name];
    }

    function setRecord(string calldata name, string calldata record) public {
        require(domains[name] == msg.sender);
        records[name] = record;
    }

    function getRecord(string calldata name) public view returns(string memory) {
        return records[name];
    }
    
}