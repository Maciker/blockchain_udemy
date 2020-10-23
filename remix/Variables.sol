pragma solidity ^0.5.17;

contract WorkingWithVariables {
    uint256 public myUint;
    
    function setMyUnit(uint _myUint) public {
        myUint = _myUint;
    }
    
    bool public myBool;
    
    function setMyBool(bool _myBool) public {
        myBool = _myBool;
    }
    
    uint8 public myUnit8;
    
    function incrementUint() public {
        myUnit8++;
    }
    
    function decrementUint() public {
        myUnit8--;
    }
    
    address public myAddress;
    
    function setAddress(address _myaddress) public {
        myAddress = _myaddress;
    }
    
    function getBalance() public view returns(uint) {
        return myAddress.balance;
    }
    
    string public myString = 'hello world';
    
    function setMyString(string memory _myString) public {
        myString = _myString;
    }
}