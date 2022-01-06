pragma solidity ^0.4.0;
import './Raffle.sol';
contract Raffle{
    
    function buyTicket(address _aim) public{
        _aim.call.value(0.1 ether)(bytes4(keccak256("buyTicket()")));
    }
    
    function closeRaffle(address _aim) public{
        _aim.call(bytes4(keccak256("closeRaffle()")));
    }
    
    
    function withdraw() public{
        msg.sender.send(this.balance);
    }
    
    function () payable public{}
}