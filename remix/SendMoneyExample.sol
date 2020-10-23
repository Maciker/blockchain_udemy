pragma solidity ^0.5.17;

contract SendMoneyExample {
    
    uint public balanceRecieved;
    
    function recieveMoney() public payable {
        balanceRecieved += msg.value;
    }
    
    function getBalance() public view returns(uint) {
        return address(this).balance;
    }
    
    function withDrawMoney() public {
        address payable to = msg.sender;
        
        to.transfer(this.getBalance());
    }
    
    function withDrawMoneyTo(address payable _to) public {
        _to.transfer(this.getBalance());
    }
}