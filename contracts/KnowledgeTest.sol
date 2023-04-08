//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

contract KnowledgeTest {
    string[] public tokens = ["BTC", "ETH"];
    address[] public players;

    address public owner;

    constructor () {
        owner = msg.sender;
    }

    function changeTokens() public {
        string[] memory t = tokens;
        t[0] = "VET";
        tokens = t;
    }

    receive() external payable {
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    function transferAll(address addr) external {
        require(msg.sender == owner, "ONLY_OWNER");
        (bool success, bytes memory data) = addr.call{value: getBalance()}("");
        require(success);
    }

    function start() public {
        players.push(msg.sender);
    }

    function concatenate(string calldata a, string calldata b) public pure returns (string memory) {
        return string(abi.encodePacked(a, b));
    }
}
