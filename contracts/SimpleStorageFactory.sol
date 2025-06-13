// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

import "./SimpleStorage.sol"; //to import code of simplestorage contract

contract SimpleStorageFactory{
    
    SimpleStorge[] public simpleStorageArray; //----1
    //address[] public simpleStorageArrayAdresses ----2

    function createSimpleStorageContarct() public {
        SimpleStorge simpleStore = new SimpleStorge(); //deploying contract from here using new keyword
        simpleStorageArray.push(simpleStore); //we are storing the address of Simple Storage in storage array
        //creating a copy and pushing it in to the array
    }

    //accesing the functions of simpleStorage Contract by address and abi - application byte interface
    function sfStore(uint _simpleStoreAddrIndex, uint256 _favNumber) public {
        //SimpleStorge simpleStoreFunction = SimpleStorge(simpleStorageArray[_simpleStoreAddrIndex]); to make it a simplestore address
        SimpleStorge simpleStoreFunction = simpleStorageArray[_simpleStoreAddrIndex]; //...for 1
        simpleStoreFunction.store(_favNumber); //calling a function of the contract from above using sfStore function
        // this is how we call functions from other contracts
    }

    function sfReveal(uint _simpleStoreAddrIndex) public view returns (uint256){
         SimpleStorge simpleStoreFunction = simpleStorageArray[_simpleStoreAddrIndex];  ///calling a function of the contract from above using sfReveal function
        return simpleStoreFunction.reveal(); //
    }
    

}