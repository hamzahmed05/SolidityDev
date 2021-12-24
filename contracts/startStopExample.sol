pragma solidity >=0.5.11;
// SPDX-License-Identifier: GPL-3.0-or-later


contract startStopExample {

    address owner;
    bool paused;

    constructor () {
        owner = msg.sender;
    }

    function setPaused(bool _paused) public {
        require(owner == msg.sender, "You cannot withdraw.");
        paused = _paused;
    }

    function sendMoney() public payable {

    }

    function withdrawAllMoney(address payable _to) public {
        require(owner == msg.sender, "You cannot withdraw.");
        require(paused == false, "You cannot withdraw.");
        _to.transfer(address(this).balance);

    }
}

