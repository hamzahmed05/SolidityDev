// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/**
 * @title Storage
 * @dev Store & retrieve value in a variable
 */
contract Storage {

    uint public myUint = 10;
    function setUint(uint _myUint) public {
        myUint = _myUint;
    }
}