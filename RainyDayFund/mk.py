import rlp
from eth_utils import keccak, to_checksum_address, to_bytes
def mk_contract_address(sender, nonce):
        sender_bytes = to_bytes(hexstr=sender)
        raw = rlp.encode([sender_bytes, nonce])
        h = keccak(raw)
        address_bytes = h[12:]
        return to_checksum_address(address_bytes)

for x in range(1,101):
        addr = mk_contract_address("0x<Creator_Address_Here>",x)
        print(f"nonce: {x} contract: {addr}")