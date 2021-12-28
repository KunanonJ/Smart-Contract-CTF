var Web3 = require('web3');
 // Create a web3 object
var web3 = new Web3();
 // Connect to the ROPSTEN test node with infura
web3.setProvider(new Web3.providers.HttpProvider("https://ropsten.infura.io/v3/de3d05cd4da642858596ded37bf6765b"))
web3.eth.getStorageAt("0xb737358983bc8924ae7d59168462a250217ded20", 1).then(console.log)
//Return 0x0000000000000000000000000000000000000000000000000000000000000f3d
//Convert from Hexadecimal to Decimal via https://www.rapidtables.com/convert/number/hex-to-decimal.html Result is 3901