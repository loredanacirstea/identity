// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Faucet {
    uint256 value = 1000000 gwei; // 0.001 eth

    constructor () payable {}
    receive() external payable {}

    function gimme() public {
        address payable requester = payable(msg.sender);
        send(requester);
    }

    function send(address payable receiver) public {
        if (receiver.balance < value) {
            receiver.transfer(value);
        }
    }
}
