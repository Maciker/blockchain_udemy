pragma solidity ^0.5.17;

contract FuncionsExample {
    
    mapping(address => uint) public balanceRecieved;
    
    address payable owner;
    
    constructor() public {
        owner = msg.sender;
    }
    
    function destroySmartContract() public {
        require(msg.sender == owner, 'You are not the owner');
        selfdestruct(owner);
    }
    
    function recieveMoney() public payable {
        assert(balanceRecieved[msg.sender] + msg.value >= balanceRecieved[msg.sender]);
        balanceRecieved[msg.sender] += msg.value;
    }
    
    function withdrawMoney(address payable _to, uint _amount) public {
        require(_amount <= balanceRecieved[msg.sender], 'not enough money');
        assert(balanceRecieved[msg.sender] >= balanceRecieved[msg.sender] - _amount);
        balanceRecieved[msg.sender] -= _amount;
        _to.transfer(_amount);
    }
    
    function getOwner() public view returns(address) {
        return owner;
    }
    
    function converWeiToEther(uint _amountInWei) public pure returns(uint) {
        return _amountInWei / 1 ether;
    }
    
    function () external payable{
        recieveMoney();
    }
}