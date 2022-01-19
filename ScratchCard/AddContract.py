import rlp
from eth_utils import keccak, to_checksum_address, to_bytes
def mk_contract_address(sender, nonce):
    sender_bytes = to_bytes(hexstr=sender)
    raw = rlp.encode([sender_bytes, nonce])
    h = keccak(raw)
    address_bytes = h[12:]
    return to_checksum_address(address_bytes)

for x in range(364,366):
    addr = mk_contract_address("0x43065950E0185BD74361D8580Daaa5BFF806aaDE",x)
    print(f"nonce: {x} contract: {addr}")

# Attacker Address 0x43065950E0185BD74361D8580Daaa5BFF806aaDE
# Nonce contract 364 0x3981964D56fFa1D868da89b6B911E946c1408a98
# Nonce contract 365 0x350eb7D0E28dD0105ed5c56E215726102d12D1d6