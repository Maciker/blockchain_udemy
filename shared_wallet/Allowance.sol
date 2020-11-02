pragma solidity ^0.6.0;

import 'https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol';

import 'https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/math/SafeMath.sol';

contract Allowance is Ownable {
    
    // using SafeMath we can avoid the wrap arround on uint.
    using SafeMath for uint;
    
    // A event to show from who to who person send some amount of ether.
    event AllowanceChanged(address indexed _forWho, address indexed _fromWho, uint _oldAmount, uint _newAmount);
        
    mapping(address => uint) public allowance;
    
    function addAllowance(address _who, uint _amount) public onlyOwner {
        emit AllowanceChanged(_who, msg.sender, allowance[_who], _amount);
        allowance[_who] = _amount;
    }
    
    modifier ownerOrAllowed(uint _amount) {
        require(owner() == msg.sender || allowance[msg.sender] >= _amount, 'You are not allowed');
        _;
    }
    
    // Function to avoid the double expending
    function reduceAllowance(address _who, uint _amount)  internal {
        emit AllowanceChanged(_who, msg.sender, allowance[_who], allowance[_who].sub(_amount));
        /* to avoid use require or assert to avoid the wrap arround on the numbers we use safeMath
        allowance[_who] -= _amount;
        */
        allowance[_who].sub(_amount);
    }
}