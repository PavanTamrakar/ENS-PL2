// SPDX-Licence-Identifier: UNLICENCED 

pragma solidity ^0.8.10;

import "hardhat/console.sol";

contract Domains {
    constructor(){
        console.log("My Polygon L2 ENS");
    }

    mapping(string => address) public domains;

    function register(string calldata name) public {
        domains[name] = msg.sender;
    }

    function getAddress(string calldata name) public view returns(address) {
        return domains[name];
    }
}