// SPDX-License-Identifier: MIT

pragma solidity ^0.8.25;


contract ArraysExercise {
    uint[] numbers = [1,2,3,4,5,6,7,8,9,10];
    address[] senders;
    uint[] timestamps;

    function getNumbers() public view returns (uint[] memory){
        return numbers;
    }

    function resetNumbers() public {
        numbers = [1,2,3,4,5,6,7,8,9,10];
    }

    function appendToNumbers(uint[] calldata _toAppend) public {
        // numbers.push(_toAppend);
        for (uint i=0; i<_toAppend.length; i++) {
            numbers.push(_toAppend[i]);
        }   
    }

    function saveTimestamp(uint _unixTimestamp) public {
        senders.push(msg.sender);
        timestamps.push(_unixTimestamp);
    }

    function afterY2K() public view returns (uint[] memory, address[] memory){
        uint256 afterY2KCount = 0;

        for (uint i=0; i < timestamps.length; i++){
            if (timestamps[i]> 946702800){
                afterY2KCount++;
            }
        }

        address[] memory afterY2KSenders = new address[](afterY2KCount);
        uint[] memory afterY2KTimestamps = new uint[](afterY2KCount);
        
        uint j=0;
        for (uint i=0; i < timestamps.length; i++){
            if (timestamps[i]> 946702800){
                afterY2KSenders[j] = senders[i];
                afterY2KTimestamps[j] = timestamps[i];
                j++;
            }
        }    

        return (afterY2KTimestamps, afterY2KSenders);
    }

    function resetSenders() public {
        delete senders;
    }

    function resetTimestamps() public {
        delete timestamps;
    }
}
