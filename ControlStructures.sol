// SPDX-License-Identifier: MIT

pragma solidity ^0.8.5;

contract ControlStructures{
    function fizzBuzz(uint _number) pure public returns (string memory){
        if (_number % 3 == 0){
            if (_number % 5 == 0)
                return "FizzBuzz";
            return "Fizz";
        }else if(_number % 5 == 0){
            return "Buzz";
        
        }else {
            return "Splat";
        }
    }

    error AfterHours(uint _time);

    function doNotDisturb(uint _time) pure public returns (string memory){
        assert(_time < 2400);
        if ((_time > 2200) || (_time < 800)) revert AfterHours(_time);
        if (_time>= 1200 && _time < 1300) return "At lunch!";
        if (_time>= 800 && _time < 1200) return "Morning!";
        if (_time>= 1300 && _time < 1800) return "Afternoon!";
        if (_time>= 1800 && _time <= 2200) return "Evening!";
    }
}
