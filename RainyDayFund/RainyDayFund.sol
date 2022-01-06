pragma solidity 0.4.24;



contract DebugAuthorizer{
    
    bool public debugMode;

    constructor() public payable{
        if(address(this).balance == 1.337 ether){
            debugMode=true;
        }
    }
}

contract RainyDayFund{

    address public developer;
    mapping(address=>bool) public fundManagerEnabled;
    DebugAuthorizer public debugAuthorizer;

    constructor(address _ctfLauncher, address _player) public payable
        
    {
        //debugAuthorizer = (new DebugAuthorizer).value(1.337 ether)(); // Debug mode only used during development
        debugAuthorizer = new DebugAuthorizer();
        developer = msg.sender;
        fundManagerEnabled[msg.sender] = true;
    }
    
    modifier isManager() {
        require(fundManagerEnabled[msg.sender] || debugAuthorizer.debugMode() || msg.sender == developer, "Unauthorized: Not a Fund Manager");
         _;
    }

    function () external payable{
        // Anyone can add to the fund    
    }
    
    function addFundManager(address _newManager) external isManager{
        fundManagerEnabled[_newManager] = true;
    }

    function removeFundManager(address _previousManager) external isManager{
        fundManagerEnabled[_previousManager] = false;
    }

    function withdraw() external isManager{
        msg.sender.transfer(address(this).balance);
    }
}