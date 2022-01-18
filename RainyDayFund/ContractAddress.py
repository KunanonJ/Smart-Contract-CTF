# Address Calculation Script source: https://programmersought.com/article/47913744397/
# need install pyethereum module
import rlp
from ethereum import utils
address = 0xc0fafeb583f141ac81adbadd186088dda9fcb759
nonce = 1
rlp_res = rlp.encode([address,nonce])
# print(rlp_res)
sha3_res = utils.mk_contract_address(address,nonce)
# print(sha3_res)
sha3_res_de = utils.decode_addr(sha3_res)
print("contract_address: 0x" + sha3_res_de)

# Creator Address = 0xeD0D5160c642492b3B482e006F67679F5b6223A2
# RainyDayFund nonce at 460 = 0xa27f0a1caf756a324f15a38bdef86984becf1b38
# DebugAuthorizer nonce at 1 = 0xc6eafc38db5ec57e56749b2458b1af5e82c94d93

# RainyDayFund nonce at 461 = 0xe08a423b77da14ca3ef234df0c960f40603f8cb0
# DebugAuthorizer nonce at 1 = 0xb11e7e3a9f501d7702883f45435b74150e216ce0