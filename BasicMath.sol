// SPDX-License-Identifier: MIT

pragma solidity ^0.8.5;

contract BasicMath {
    function adder(uint256 _a, uint256 _b) external pure returns (uint256 sum, bool error) {
        unchecked {
            uint256 _c = _a + _b;
            if (_c < _a) return (0, true);
            return (_c, false);
        }
    }

    function subtractor(uint256 _a, uint256 _b) external pure returns (uint256 difference, bool error) {
        if (_b > _a) {
            return (0, true);
        }
        return (_a - _b, false);
    }
}
