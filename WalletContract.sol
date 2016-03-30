contract Small {
    Big b;
  
    address private owner;

    function Small(address bigAddress){
        b=Big(bigAddress);
        owner = msg.sender;
    }
    function GetOwner() returns (address){
        return owner;
    }
    function SetOwner(address newOwner){
        if(msg.sender == owner) {
            owner = newOwner;
        }
    }

    function SetBigContract(address newAddress){
        if(msg.sender==address(b)) { 
            b=Big(newAddress);
        }
    }
    function GetMoney(uint weiAmount,address toAddress){
        if(msg.sender==address(b)) { 
            toAddress.send(weiAmount);
        }
    }
    function UniversalFunctionSecure(uint8 functionNumber,bytes32 p1,bytes32 p2,bytes32 p3,bytes32 p4,bytes32 p5){
        if(msg.sender == owner) {
            b.UniversalFunction(functionNumber,p1,p2,p3,p4,p5);
        }
    }
}