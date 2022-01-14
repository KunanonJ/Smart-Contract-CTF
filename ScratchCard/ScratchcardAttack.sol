pragma solidity 0.4.24;
import './Scratchcard.sol';

interface Scratchcard {
  function play() external payable;
  function checkIfMegaJackpotWinner() external returns(bool);
  function collectMegaJackpot(uint256 _amount) external;
  function () external payable;
}