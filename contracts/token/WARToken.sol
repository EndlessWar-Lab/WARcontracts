// SPDX-License-Identifier: MIT

pragma solidity ^0.8.2;

import "@openzeppelin/contracts/access/Ownable.sol";
import './../token/BEP20.sol';
import '@openzeppelin/contracts/utils/Context.sol';


contract WARToken is Ownable, BEP20 {

    constructor(address wallet, uint256 totalSupply) Ownable() BEP20("EndlessWar Token","WAR") {
         
        _mint(wallet, totalSupply);
        transferOwnership(wallet);
    }
    
    /**
     * @dev Creates `amount` tokens and assigns them to `msg.sender`, increasing
     * the total supply.
     *
     * Requirements
     *
     * - `msg.sender` must be the token owner
     */
    function mint(uint256 amount) public onlyOwner returns (bool) {
        uint256 totalSupply = totalSupply();
        require(
            totalSupply + amount < 268600000 ether,
            'WAR::mint: exceeding the permitted limits');
        _mint(_msgSender(), amount);
        return true;
    }


}