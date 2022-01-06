pragma solidity 0.4.24;



contract Raffle{

    uint256 constant fee = 0.1 ether;

    address private admin;

    bytes4 private winningTicket;
    uint256 private blocknum;

    uint256 public ticketsBought;
    bool public raffleStopped;

    mapping(address=>uint256) private rewards;
    mapping(address=>bool) private potentialWinner;
    mapping(address=>bytes4) private ticketNumbers;

    constructor(address _ctfLauncher, address _player) public payable
        
    {
        rewards[address(this)] = msg.value;
        admin = msg.sender;
    }

    function buyTicket() external payable{
        if(msg.value >= fee){
            winningTicket = bytes4(0);
            blocknum = block.number+1;
            ticketsBought += 1;
            raffleStopped = false;
            rewards[msg.sender] += msg.value;
            ticketNumbers[msg.sender] = bytes4((msg.value - fee)/10**8);
            potentialWinner[msg.sender] = true;
        }
    }

    function closeRaffle() external{
        require(ticketsBought>0);
        require(!raffleStopped);
        require(blocknum != 0);
        require(winningTicket == bytes4(0));
        require(block.number>blocknum);
        require(msg.sender==admin || rewards[msg.sender]>0);
        winningTicket = bytes4(blockhash(blocknum));
        potentialWinner[msg.sender] = false;
        raffleStopped = true;
    }

    function collectReward() external payable{
        require(raffleStopped);
        require(potentialWinner[msg.sender]);
        rewards[address(this)] += msg.value;
        if(winningTicket == ticketNumbers[msg.sender]){
            msg.sender.transfer(rewards[msg.sender]);
            msg.sender.transfer(rewards[address(this)]); 
            rewards[msg.sender] = 0;
            rewards[address(this)] = 0;
        }
    }

    function skimALittleOffTheTop(uint256 _value) external{
        require(msg.sender==admin);
        require(rewards[address(this)]>_value);
        rewards[address(this)] = rewards[address(this)] - _value;
        msg.sender.transfer(_value);
    }

    function () public payable{
        if(msg.value>=fee){
            this.buyTicket();
        }
        else if(msg.value == 0){
            this.closeRaffle();
        }
        else{
            this.collectReward();
        }
    }

}



