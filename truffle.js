var HDWalletProvider = require("truffle-hdwallet-provider");
var infura_apikey = "XXXXXX";
var mnemonic = "twelve words you can find in metamask/settings/reveal seed words blabla";

module.exports = {
  // See <http://truffleframework.com/docs/advanced/configuration>
    // to customize your Truffle configuration!
    networks: {
	development: {
	    host: "127.0.0.1",
	    port: 7545,
	    network_id: "*"
	    
	},
    	rinkeby: {
      		host: "localhost", // Connect to geth on the specified
      		port: 8545,
      		from: "0xbaB939d600e8CE222eD42B05D714d095fb4D690b", // default address to use for any transaction Truffle makes during migrations
      		network_id: 4,
      		gas: 4612388 // Gas limit used for deploys
    	},
     ropsten: {
      provider: new HDWalletProvider(mnemonic, "https://ropsten.infura.io/"+infura_apikey),
      network_id: 3
    }
	    
    }
};
