pragma solidity ^0.5.17;

contract Owned {
    
    address owner;
    
    constructor() public {
        owner = msg.sender;
    }
    
    // use the modifier to copy in some functions the same code
    modifier onlyOwner() {
        require(msg.sender == owner, 'you are not the owner');
        _;
    }
    
}