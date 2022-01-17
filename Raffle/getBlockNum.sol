pragma solidity 0.4.24;

contract Test{

    function getBlockNum() public view returns(uint) {
        return block.number;
    }
}