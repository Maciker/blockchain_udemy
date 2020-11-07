pragma solidity 0.6.0;

import "./Crowdsale.sol";
import "./KycContract.sol";

contract MyTokenSale is Crowdsale {

    KycContract kyc;

    constructor(
        uint256 rate,
        address payable wallet,
        IERC20 token,
        KycContract _kyc
    )
        Crowdsale(rate, wallet, token)
        public
        {
            kyc = _kyc;
        }


        function _preValidatePruchase() internal view override {
            //Over ride the crowdsale pre validate function.
            //Open Zeppelin version 2.5.0
        }
}