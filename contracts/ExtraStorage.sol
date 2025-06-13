// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

import "./SimpleStorage.sol";

contract ExtraStorage is SimpleStorge{
    
    //overrides the function store of simpleStorage contract
    function store(uint256 _favNumber )public override { 
        favoriateNumber = _favNumber + 5;
    }
        
}