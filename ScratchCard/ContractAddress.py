import rlp
from ethereum import utils
address = 0x43065950E0185BD74361D8580Daaa5BFF806aaDE
nonce = 222
rlp_res = rlp.encode([address,nonce])
# print(rlp_res)
sha3_res = utils.mk_contract_address(address,nonce)
# print(sha3_res)
sha3_res_de = utils.decode_addr(sha3_res)
print("contract_address: 0x" + sha3_res_de)

# Nonce 221 0xa937f3198a70f91ee3c099918c8b252e5e8d1b0b
# Nonce 222 0x4506ef9bcf9276672b3670f42d12061a983620d7
