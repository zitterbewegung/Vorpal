/*
   Kraken-based ETH/XBT price ticker

   This contract keeps in storage an updated ETH/XBT price,
   which is updated every ~60 seconds.
*/

pragma solidity ^0.4.0;
import "github.com/oraclize/ethereum-api/oraclizeAPI.sol";

contract BVOL24HTicker is usingOraclize {
    
    string public BVOL24H;
    
    event newOraclizeQuery(string description);
    event newBVOL24HPriceTicker(string price);
    

    function BVOL24HPriceTicker() {
        oraclize_setProof(proofType_TLSNotary | proofStorage_IPFS);
        update();
    }

    function __callback(bytes32 myid, string result, bytes proof) {
        if (msg.sender != oraclize_cbAddress()) throw;
        BVOL24H = result;
        newBVOL24HPriceTicker(BVOL24H);
        update();
    }
    
    function update() payable {
        if (oraclize.getPrice("URL") > this.balance) {
            newOraclizeQuery("Oraclize query was NOT sent, please add some ETH to cover for the query fee");
        } else {
            newOraclizeQuery("Oraclize query was sent, standing by for the answer..");
            oraclize_query(86400, "URL", "json(https://www.bitmex.com/api/v1/trade?symbol=.BVOL24H&count=100&reverse=false&startTime=05%2F29%2F2018&endTime=05%2F29%2F2018).0.price");
        }
    }
    
} 
