// A particular financial institution is looking to have their records stored onchain 
// and looking to have an *external *`identifier` tied to each customers Details....
// the identifier should be the keccak256 hash of the customer's name and time of registration , 
// each customer can also approve another customer to view their details[meaning that only admins
// and approved customers have the right to view another customer's data]....For simplicity purposes,
// the Bank is looking to have a separate contract that has all *setter* 
// functions and another contract that has all the *getter * functions(Interacting with each other of course)..Finally, 
// they want an interface for all the contracts they have......
// // NOTE: USE THE APPROPRIATE FUNCTION AND VARIABLE VISIBILITY SPECIFIERS

// Write a Js Script that would do exactly what your smart contract was doing....
// NOTE: YOU ARE NOT INTERACTING WITH THE CONTRACT, YOU ARE ONLY CLONING THE CONTRACT BUT IN JAVASCRIPT...USE THE APPROPRIATE NODE_MODULES


// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

interface IBankSetter{
    struct Cust {
         string name;
         bytes4 hash;
         address _address;
     }
      function setCust(string memory _name, address _CustAddr) external returns(Cust memory);
      function access(address _addr, bytes4 _custHash) external;
      function withdraw(address _addr, bytes4 _custHash) external;
}


contract BankSetter {
     address public admin;
    constructor(address _admin){
        admin = _admin;
    }
    
    struct Customer {
        string name;
        bytes4 hash;
        address _address;
    }
    
    mapping(bytes4 => Customer) public customerHash;
    mapping(bytes4=>mapping(address => bool)) public permission;
    
    function setCust(string memory _name, address _custAddr) public returns(Customer memory){
       bytes4 _custHash = bytes4(keccak256(abi.encodePacked(_name, block.timestamp)));
       Customer storage customer = customerHash[_custHash];
       customer.name = _name;
       customer.hash = _custHash;
       customer._address = _custAddr;
       access(_custAddr,_custHash);
       return customer;
    }
    
    function access(address _addr, bytes4 _custHash) public {
        Customer memory customer = customerHash[_custHash];
        require(customer._address == msg.sender || admin == msg.sender, "invalid hash");
        permission[_custHash][_addr] = true;
    }
    
    function withdraw(address _addr, bytes4 _custHash) public {
        Customer memory customer = customerHash[_custHash];
        require(customer._address == msg.sender || admin == msg.sender, "invalid hash");
        permission[_custHash][_addr] = false;
    }
    
}

abstract contract Context {
    function _msgSender() internal view virtual returns (address) {
        return msg.sender;
    }
    function _msgData() internal view virtual returns (bytes calldata) {
        return msg.data;
    }
}

contract BankGetter is Context {
     BankSetter Icust;
     
     constructor(address contractAdd){
         Icust = BankSetter(contractAdd);
     }
     
    function getCust(bytes4 _custHash) public view returns (string memory, bytes4, address){
        require(Icust.admin() == _msgSender()
        || Icust.permission(_custHash,_msgSender()) == true, "access denied");
        return Icust.customerHash(_custHash);
    }
    
}


