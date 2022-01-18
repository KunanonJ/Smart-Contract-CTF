var util = require('ethereumjs-util');
 // The address of the generated new contract according to the sender address and NONCE
 // First RLP encoding, then Hash, 20 bytes of the HASH value
var developer = "eD0D5160c642492b3B482e006F67679F5b6223A2";

for(var i = 1; i <= 10000000; i++){
	buf = [Buffer.from(developer , "hex"), i];
	// RainyDayFund.address == c0fafeb583f141ac81adbadd186088dda9fcb759
	if(util.keccak256(util.rlp.encode(buf)).toString("hex").slice(-40) == "c0fafeb583f141ac81adbadd186088dda9fcb759"){
		console.log(i);
		break;
	}
}
// result: i = 459