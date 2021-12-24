pragma solidity >=0.5.11;
// SPDX-License-Identifier: GPL-3.0-or-later


contract SendMoneyExample {

    uint public balanceReceived;

    function receiveMoney() public payable {
        balanceReceived += msg.value;
    }

    function getBalance() public view returns(uint) {
        return address(this).balance;
    }
     function withdrawMoney() public {
        address payable to = payable(msg.sender);
        to.transfer(getBalance());
    }

    function withdrawAllMoney(address payable _to) public {
        uint balancetosend = balanceReceived[msg.sender];
        balanceReceived[msg.sender] = 0;
        _to.transfer(balancetosend);
    }
}

