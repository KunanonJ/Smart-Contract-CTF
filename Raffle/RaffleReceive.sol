pragma solidity ^0.4.0;

contract Raffle2{
    
    function buyTicket(address _aim) public{
        _aim.call.value(0.1 ether)(bytes4(keccak256("buyTicket()")));
    }
    
    function collectReward(address _aim) public{
        _aim.call(bytes4(keccak256("collectReward()")));
    }
    
    
    function withdraw() public{
        msg.sender.send(this.balance);
    }
    
    function () payable public{}
}