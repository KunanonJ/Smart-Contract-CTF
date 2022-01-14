import rlp 
from ethereum import utils 
address = 0x88D3052D12527F1FbE3a6E1444EA72c4DdB396c2 
nonce = 413 
rlp_res = rlp.encode([address,nonce]) 
print(rlp_res) 
sha3_res = utils.mk_contract_address(address,nonce) 
print(sha3_res) 
code sha3_res_de = utils_res_de 
print("contract_address: " + sha3_res_de)