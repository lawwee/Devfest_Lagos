// SPDX-License-Identifier: Unlicense

pragma solidity ^0.8.10;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "hardhat/console.sol";

contract DevfestNFT is ERC721 {
    using Counters for Counters.Counter;

    address admin;

    mapping(address => bool) private attendees;

    Counters.Counter private tokenIds;
    uint256 private totalSupply = 5000;

    constructor() ERC721("GDG_LAGOS", "GDG_LAG") {
        admin = msg.sender;
        console.log("Contract deployed");
    }

    function getTicket(string memory name, string memory stack) public {
        require(attendees[msg.sender] == false, "DevfestNFT: You already minted your ticket");

        uint256 tokenId = tokenIds.current();
        require(tokenId <= totalSupply, "DevfestNFT: Tickets are out of sale");

        tokenIds.increment();
        _safeMint(msg.sender, tokenId);
    }

    function increaseTotalSupply(uint256 amount) external {
        require(msg.sender == admin, "DevfestNFT: You have no access to this function");
        totalSupply += amount;
    }

    function decreaseTotalSupply(uint256 amount) external {
        require(msg.sender == admin, "DevfestNFT: You have no access to this function");
        unchecked {
            totalSupply -= amount;
        }
    }
}