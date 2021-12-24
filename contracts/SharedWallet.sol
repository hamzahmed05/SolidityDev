pragma solidity >=0.5.11;
// SPDX-License-Identifier: GPL-3.0-or-later
import "./Allowance.sol";



contract SharedWallet is Allowance {

    event moneySent(address indexed beneficiary, uint amount);

    event moneyReceived(address indexed from, uint amount);

    function withdrawMoney(address payable _to, uint _amount) public ownerOrAllowed(_amount) {
        require(_amount <= address(this).balance, "Contract doesn't contain enough money");
        if(!isOwner()) {
            reduceAllowance(msg.sender, _amount);
        }
        emit moneySent(_to, _amount);
        _to.transfer(_amount);


    }
    function renounceOwnership() public view override onlyOwner {
         revert("can't renounceOwnership here"); //not possible with this smart contract
    }

    receive() external payable {
        emit moneyReceived(msg.sender, msg.value);
    }


}