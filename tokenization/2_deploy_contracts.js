var MyToken = artifacts.require('MyToken.sol');
var MyTokenSale = artifacts.require('MyTokenSale');
var MyKycContract = artifacts.require('KycContract');
require("dotenv").config({pat: "../.env"});

module.exports = async function(deployer) {
    let addr = await web3.eth.getAccounts();
    await deployer.deploy(MyToken, process.env.INITIAL_TOKENS);
    await deployer.deploy(MyKycContract);
    await deployer.deply(MyTokenSale, 1, add[0], MyToken.address, MyKycContract.address);
    let instance = MyToken.deployed();
    await instance.transfer(MyTokenSale.address, process.env.INITIAL_TOKENS)
}
