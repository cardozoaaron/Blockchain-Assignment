// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Lottery {
    // create array of cutomer with the number of there lottry
    uint[8][] lottery;
    // seed to genrate random number
    uint private seed ;
    // array that holds winning number
    uint[8] private winner ;
    constructor(){
        // initializing seed with 256-bit intiger which is genrated by block.timestamp it os value at block was mine
        seed = block.timestamp;
        // assigning value of winnig lottry
        winner=[0,3,0,9,2,0,0,3];
    }
    // function to genrate random number between 0 to 9 
    function randomBetween0And9() private returns (uint) {
        // increaseing seed so that new neat number will be diffrent
        seed+=1;
        // seed to byte to hashcode to uint256 and at last module 10 to be in range of 0 to 9
        return uint256(keccak256(abi.encodePacked(seed))) % 10;
    }
    //if existing customer want's new lottery with old id  
    function DrawLottry(uint id) public returns (uint[8] memory){
        // checking if customer exist
        require(id-1<lottery.length,"Invalid Id");
        // genrating new lottery number
        for (uint i=0;i<8;i++){
            lottery[id-1][i] = randomBetween0And9();
        }
        // returning new lottery
        return lottery[id-1];
    }
    // new customer want's lottery
    function NewCustomer()public returns(uint ,uint[8] memory){
        // temp array to  genarate lottery
        uint[8] memory temp ;
        for (uint i=0; i<8; i++) {
            temp[i] = randomBetween0And9();
        }
        // pushing new customer into array with lottery number
        lottery.push(temp);
        //returning cutomer id and lottery
        return (lottery.length,temp);
    }
    //checking for lottery winner
    function CheckLottey(uint id) public returns(string memory) {
        require(id-1<lottery.length,"Invalid Id");
        // matching numbers
        for (uint i=0; i<8; i++) 
        {
            // if number does not match then revert to old state
            require(lottery[id-1][i] == winner[i],"Batter Luck next time");
        }
        // else change winner lottery number and show that it was winning lottery
        for (uint i=0; i<8; i++) 
        {
            winner[i] = randomBetween0And9();
        }
        return "Winner 7 Crore";
    }
}
