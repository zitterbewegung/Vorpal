pragma solidity ^0.4.19;

import 'zeppelin-solidity/contracts/token/ERC20/MintableToken.sol';

contract VorpalCoin is MintableToken {
    string public name = "Vorpal Coin";
    string public symbol = "VRP";
    uint8 public decimals = 18;
}
