// contracts/GLDToken.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20 {
    constructor(uint256 initialSupply) public ERC20("StarDucks Cappucino Token", "CAPPU", 0) {
        _mint(msg.sender, initialSupply);
    }
}