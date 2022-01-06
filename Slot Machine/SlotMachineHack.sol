pragma solidity 0.4.24;
import './SlotMachine.sol';
contract selfdes{
    function destruct(address _aim) public{
        selfdestruct(_aim);
    }
    
    function () payable public{
        
    }
}