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
      provider: new HDWalletProvider(mnemonic, "https://rinkeby.infura.io/"+infura_apikey),
      network_id: 3
    },
     ropsten: {
      provider: new HDWalletProvider(mnemonic, "https://ropsten.infura.io/"+infura_apikey),
      network_id: 3
    }
	    
    }
};
