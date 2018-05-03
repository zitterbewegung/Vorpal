pragma solidity ^0.4.11;
//import "github.com/oraclize/ethereum-api/oraclizeAPI.sol";
//urls won't work on solc yet.
import "./oraclizeAPI_0.5.sol";

contract VolatilityOracle is usingOraclize {

    string public VBTC;
    event LogConstructorInitiated(string nextStep);
    event LogPriceUpdated(string price);
    event LogNewOraclizeQuery(string description);

    function ExampleContract() payable {
        LogConstructorInitiated("Constructor was initiated. Call 'updatePrice()' to send the Oraclize Query.");
    }

    function __callback(bytes32 myid, string result) {
        if (msg.sender != oraclize_cbAddress()) revert();
        VBTC = result;
        LogPriceUpdated(result);
    }

    function updatePrice() payable {
        if (oraclize_getPrice("URL") > this.balance) {
            LogNewOraclizeQuery("Oraclize query was NOT sent, please add some ETH to cover for the query fee");
        } else {
            LogNewOraclizeQuery("Oraclize query was sent, standing by for the answer..");

	    
            oraclize_query("URL", "json(https://datasette-qrpzbwbsrn.now.sh/csv-data-e458a2f/bitcoinity_data.json).rows");
        }
    }
}

//How to acces endpoint


//var data = {"database": "csv-data", "rows": [["2018-04-01 00:00:00 UTC", 26.195671693117102], ["2018-04-02 00:00:00 UTC", 23.8913627282478], ["2018-04-03 00:00:00 UTC", 21.9345330105318], ["2018-04-04 00:00:00 UTC", 25.0430302443494], ["2018-04-05 00:00:00 UTC", 27.701299384335798], ["2018-04-06 00:00:00 UTC", 16.6619948445269], ["2018-04-07 00:00:00 UTC", 14.471105628403098], ["2018-04-08 00:00:00 UTC", 12.335753186148], ["2018-04-09 00:00:00 UTC", 18.077308839626], ["2018-04-10 00:00:00 UTC", 11.6043714949467], ["2018-04-11 00:00:00 UTC", 6.961395793956879], ["2018-04-12 00:00:00 UTC", 31.3284080806209], ["2018-04-13 00:00:00 UTC", 28.020187310815395], ["2018-04-14 00:00:00 UTC", 19.688335890282396], ["2018-04-15 00:00:00 UTC", 14.5797989033191], ["2018-04-16 00:00:00 UTC", 18.6816159405952], ["2018-04-17 00:00:00 UTC", 13.678317960648801], ["2018-04-18 00:00:00 UTC", 16.6016601582085], ["2018-04-19 00:00:00 UTC", 14.0580767075249], ["2018-04-20 00:00:00 UTC", 20.572244713805198], ["2018-04-21 00:00:00 UTC", 21.1558772203818], ["2018-04-22 00:00:00 UTC", 17.1106179583719], ["2018-04-23 00:00:00 UTC", 12.7974203095258], ["2018-04-24 00:00:00 UTC", 23.1752046965409], ["2018-04-25 00:00:00 UTC", 49.2946626869776], ["2018-04-26 00:00:00 UTC", 28.4071934866668], ["2018-04-27 00:00:00 UTC", 24.364223828758696], ["2018-04-28 00:00:00 UTC", 25.841692072564395], ["2018-04-29 00:00:00 UTC", 19.7038580274015], ["2018-04-30 00:00:00 UTC", 17.5014082809742]], "truncated": false, "columns": ["Time", "Unnamed: 1"], "query": {"sql": "select * from [bitcoinity_data-3]", "params": {}}, "query_ms": 1.4743804931640625, "source": "From bitcoinity.org", "source_url": "https://data.bitcoinity.org/markets/volatility/30d/USD/coinbase?g=15&t=l"}
//console.log()
