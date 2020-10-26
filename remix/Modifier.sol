pragma solidity ^0.5.17;

import './Owned.sol';

// inheritance from owned.sol
contract InheritanceModifierExample is Owned {
    
    mapping(address => uint) public tokenBalance;
    
    uint tokenPrice = 1 ether;
    
    constructor() public {
        tokenBalance[owner] = 100;
    }
    
    function createNewToken() public onlyOwner {
        //require(msg.sender == owner, 'you are not the owner');
        tokenBalance[owner]++;
    }
    
    function burnToken() public onlyOwner {
        //require(msg.sender == owner, 'you are not the owner');
        tokenBalance[owner]--;
    }
    
    function purchaseToken() public payable {
        require((tokenBalance[owner] * tokenPrice) / msg.value > 0, 'not enough tokens');
        tokenBalance[owner] -= msg.value / tokenPrice;
        tokenBalance[owner] += msg.value / tokenPrice;
    }
    
    function sendToken(address payable _to, uint _amount) public {
        require(tokenBalance[msg.sender] >= _amount, 'not enough tokens');
        assert(tokenBalance[_to] + _amount >= tokenBalance[_to]);
        assert(tokenBalance[msg.sender] + _amount >= tokenBalance[msg.sender]);
        tokenBalance[msg.sender] -= _amount;
        tokenBalance[_to] += _amount;
    }
}