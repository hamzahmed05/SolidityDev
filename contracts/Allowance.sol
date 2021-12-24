pragma solidity >=0.5.11;
// SPDX-License-Identifier: GPL-3.0-or-later
import "https://github.com/OpenZeppelin/openzeppelin-contracts/contracts/access/Ownable.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/contracts/utils/math/SafeMath.sol";


contract Allowance is Ownable {

    using SafeMath for uint;
    event allowanceChanged(address indexed from, address indexed to, uint OldAmount, uint newAmount );


    mapping(address => uint) public allowance;

    function isOwner () internal view returns(bool) {
        return owner() == msg.sender;
    }

    function setAllowance(address who, uint amount) public onlyOwner{
        emit allowanceChanged(who, msg.sender, allowance[who], amount);
        allowance[who] = amount;
    }
    function reduceAllowance(address _to, uint amount) internal ownerOrAllowed(amount) {
        emit allowanceChanged(_to, msg.sender, allowance[_to], allowance[_to] - amount);
        allowance[_to] -= amount;
    }

    modifier ownerOrAllowed(uint _amount) { 
        require(isOwner() || allowance[msg.sender] >= _amount, "You're not allowed or not enough allowance");
        _;
    }


}