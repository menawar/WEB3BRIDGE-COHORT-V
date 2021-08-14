// A contract contains two very important mappings which are used to track some very *private* info...
// The first mapping allows you to know how many times an address has called a function, 
// the second one allows you to know the function hash that the address called last...
// Write three different functions that don't *really do anything but returns a bool value* and update the mappings accordingly


// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.1;


contract AssignmentFive {
    mapping(address => uint) public trackNoOfFunctionCall;
    mapping(address => bytes32) public functionHashOfPreviosAddressCall;
     
    function one() public returns(bool returnValue1) {
        trackNoOfFunctionCall[msg.sender]++;
        functionHashOfPreviosAddressCall[msg.sender] = keccak256(abi.encodeWithSignature("one()"));
        returnValue1 = true;
    }
    
    function two() public returns(bool returnValue2) {
        trackNoOfFunctionCall[msg.sender]++;
        functionHashOfPreviosAddressCall[msg.sender] = keccak256(abi.encodeWithSignature("two()"));
        returnValue2 = true;
    }
    
    function three() public returns(bool returnValue3) {
        trackNoOfFunctionCall[msg.sender]++;
        functionHashOfPreviosAddressCall[msg.sender] = keccak256(abi.encodeWithSignature("three()"));
        returnValue3 = true;
    }
}
