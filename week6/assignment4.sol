// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.1;

contract AssignmentFour {
    function functionOne(address user1, address user2, address user3) internal pure returns(bytes32 result) {
        bytes32 hashUser1And2 = keccak256(abi.encodePacked(user1, user2));
        result = keccak256(abi.encodePacked(hashUser1And2, user3));
    }
    
    function functionTwo(uint num, bytes32 value) public pure returns(bytes32 finalHash) {
         address  _user1;
         address _user2;
         address _user3;
        bytes32 hashNum = keccak256(abi.encodePacked(num));
        uint hashValue = uint(keccak256(abi.encodePacked(value)));
        (bytes32 _result)= functionOne(_user1, _user2, _user3);
        finalHash = keccak256(abi.encodePacked(hashNum, hashValue, _result));
    }
}
