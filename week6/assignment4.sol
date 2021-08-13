// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.1;

contract AssignmentFour {
    function functionOne(address user1, address user2, address user3) public pure returns(bytes32 result) {
        bytes32 hashUser1And2 = keccak256(abi.encodePacked(user1, user2));
        result = keccak256(abi.encodePacked(hashUser1And2, user3));
    }
    
    function functionTwo(uint num, bytes32 value) public pure returns(bytes32 finalHash) {
      
        bytes32 hashNum = keccak256(abi.encodePacked(num));
        bytes32 typecastHash = keccak256(abi.encodePacked(uint(value)));
        bytes32 _result= functionOne(0x78731D3Ca6b7E34aC0F824c42a7cC18A495cabaB, 0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db, 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2);
        finalHash = keccak256(abi.encodePacked(hashNum, typecastHash, _result));
    }
}

