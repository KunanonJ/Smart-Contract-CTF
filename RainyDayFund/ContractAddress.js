const util = require('ethereumjs-util');
const rlp = require('rlp');
var address1 = "0xeD0D5160c642492b3B482e006F67679F5b6223A2"
var nonce = 20
encodedRlp1 = rlp.encode([address1, nonce]);
buf1 = util.sha3(encodedRlp1);
address2 = buf1.slice(12).toString('hex');
encodedRlp2 = rlp.encode([address2, 1]);
buf2 = util.sha3(encodedRlp2);
address = buf1.slice(12).toString('hex');
console.log(address);