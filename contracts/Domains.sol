// SPDX-Licence-Identifier: UNLICENCED 

pragma solidity ^0.8.10;

import {StringUtils} from "./libraries/StringUtils.sol";

import "hardhat/console.sol";

contract Domains {

    string public tld;

    mapping(string => address) public domains;

    mapping(string => string) public records;

    constructor(string memory topLD)payable{
        tld = topLD;
    }

    function price(string calldata name) public pure returns(uint){
        uint len = StringUtils.strlen(name);
        require(len > 0, "Invalid");
        if(len == 3){
            return 5*10*17;
        }else if (len == 4){
            return 4*10*17;
        }else{
            return 1*10*17;
        }
    }

    function register(string calldata name) public payable {
        require(domains[name] == address(0));
        uint _price = price(name);

        require(msg.value >= _price, "Not enough Matic");

        domains[name] = msg.sender;

        console.log("%s has registered a domain!", msg.sender);
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