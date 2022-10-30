// SPDX-License-Identifier: Unlicense

pragma solidity ^0.8.10;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "hardhat/console.sol";

contract DevfestNFT is ERC721 {

    constructor() ERC721("GDG_LAGOS", "GDG_LAG") {
        console.log("Contract deployed");
    }
}