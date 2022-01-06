pragma solidity 0.4.24;



library Address {
    function isContract(address account) internal view returns (bool) {
        uint256 size;
        assembly { size := extcodesize(account) }
        return size > 0;
    }
}

contract Scratchcard{

    event CardPurchased(address indexed player, uint256 cost, bool winner);

    mapping(address=>uint256) private winCount;
    uint256 private cost;


    using Address for address;

    constructor(address _ctfLauncher, address _player) public payable
        
    {
    }

    modifier notContract(){
        require(!msg.sender.isContract(), "Contracts Not Allowed");
        _;
    }
    
    function play() public payable notContract{
        bool won = false;
        if((now%10**8)*10**10 == msg.value){
            won = true;
            winCount[msg.sender] += 1;
            cost = msg.value;
            msg.sender.transfer(cost);
        }
        else{
            cost = 0;
            winCount[msg.sender] = 0;
        }
        emit CardPurchased(msg.sender, msg.value, won);
    }    

    function checkIfMegaJackpotWinner() public view returns(bool){
        return(winCount[msg.sender]>=25);
    }

    function collectMegaJackpot(uint256 _amount) public notContract{
        require(checkIfMegaJackpotWinner(), "User Not Winner");
        require(2 * cost - _amount > 0, "Winners May Only Withdraw Up To 2x Their Scratchcard Cost");
        winCount[msg.sender] = 0;
        msg.sender.transfer(_amount);
    }

    function () public payable{
        play();
    }

}
