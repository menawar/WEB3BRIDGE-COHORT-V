// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.1;

contract WeekSix {
      
    function hashA(uint a, uint b) public pure returns(bytes32 newValue1) {
      newValue1  = keccak256(abi.encodePacked(a, b));
    }
    
     function hashB(uint c, uint d) public pure returns(bytes32 newValue2) {
      newValue2  = keccak256(abi.encodePacked(c, d));
    }
    
    function hashABResult(uint e, uint f, uint g, uint h) public pure returns(bytes32 result){
        (bytes32 _newValue1) = hashA(e, f);
        (bytes32 _newValue2) = hashA(g, h);
        result = keccak256(abi.encodePacked(_newValue1, _newValue2));
    }
}
 