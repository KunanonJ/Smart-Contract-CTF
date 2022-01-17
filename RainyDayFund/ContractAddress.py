# Address Calculation Script source: https://programmersought.com/article/47913744397/
# need install pyethereum module
import rlp
from ethereum import utils
address = 0x43065950E0185BD74361D8580Daaa5BFF806aaDE
nonce = 270
rlp_res = rlp.encode([address,nonce])
print(rlp_res)
sha3_res = utils.mk_contract_address(address,nonce)
print(sha3_res)
sha3_res_de = utils.decode_addr(sha3_res)
print("contract_address: " + sha3_res_de)