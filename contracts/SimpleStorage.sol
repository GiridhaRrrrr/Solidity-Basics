// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract SimpleStorge{
    //types in solidity
    //bool, uint256, int256, string, address, bytes32
    // uint256 public favoriateNumber; //public keyword makes a getter function so it returns a getter function
    uint256 favoriateNumber;

    //uses gas it is changing the state of the blockchain 
    //virtual for overiding in extraStorage
    function store(uint256 _favNum) public virtual {
        favoriateNumber = _favNum;
    }

    //dont use gas until its called under gas function 
    //view should be used to make it no gas function
    function reveal() public view returns (uint256){
        return favoriateNumber;
    }

    //pure functions dont change the state of the blockchain we cant read the valuealso its
    //only used for computation and no gas cost also
    function addPlusOne() private pure returns (uint256) {
        return 10 + 1; 
    }

    //structure(struct) is keyword used to create a datatype
    struct People{
        string name;
        uint favoriateNumber;
    }

    // People public people = People({name: "Giridhar",favoriateNumber:10});

    //to store many people we use arrays
    // People[3] public peopleList; //static array of size 3
    People[] public peopleList; //dynamic array

    //memory and calldata is used when temporary variable are used
    // for arrays, structures and maps when sending as arguments
    //storage keyword is used implicity for permenent storage
    function AddPerson(string memory _name,uint256 _favNum) public {
        // peopleList.push(People({name: _name, favoriateNumber: _favNum})
        peopleList.push(People(_name,_favNum));  //we can add like this also but naming should be in order of structure
    }

    //Mapping used as hashmap 
    mapping (string => uint) nameToFavoriteNumber;

    function map(uint256 _favNum, string memory _namepublic) public{
        nameToFavoriteNumber [_namepublic] = _favNum;
    }

    function getFavourateNumberByName (string memory _name ) public view returns(uint){
       return nameToFavoriteNumber[_name];
    }
}
