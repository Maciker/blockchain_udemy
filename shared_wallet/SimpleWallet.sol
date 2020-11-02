pragma solidity ^0.6.0;

import './Allowance.sol';

contract SimpleWallet is Allowance {

    /* Not used sin I use OpenZeppelin
    address public owner;
    
    constructor() public {
        owner = msg.sender;
    }
    
    modifier onlyOwner() {
        require(owner == msg.sender, 'You are not allowed');
        _;
    }*/
    
    // Events fired when received and withdrw money
    event MoneySent(address indexed _beneficiary, uint _amount);
    event MoneyReceived(address indexed _from, uint _amount);
    
    function withdrawMoney(address payable _to, uint _amount) public  ownerOrAllowed(_amount) {
        require(_amount <= address(this).balance, 'The are not enough funds stored in the smart contract.');
        if(owner() != msg.sender) {
            reduceAllowance(msg.sender, _amount);
        }
        emit MoneySent(_to, _amount);
        _to.transfer(_amount);
    }
    
    // Deactivating by overriding the function renounceOwnership
    function renounceOwnership() public override onlyOwner {
        revert("Can't reounce ownership here");
    }
    
    fallback () external payable {
        emit MoneyReceived(msg.sender, msg.value);
    }
}