import rlp
from eth_utils import keccak, to_checksum_address, to_bytes
def mk_contract_address(sender, nonce):
    sender_bytes = to_bytes(hexstr=sender)
    raw = rlp.encode([sender_bytes, nonce])
    h = keccak(raw)
    address_bytes = h[12:]
    return to_checksum_address(address_bytes)

for x in range(367,369):
    addr = mk_contract_address("0x43065950E0185BD74361D8580Daaa5BFF806aaDE",x)
    print(f"nonce: {x} contract: {addr}")

# Attacker Address 0x43065950E0185BD74361D8580Daaa5BFF806aaDE
# Nonce contract 367 0xb763d3420C44325026bB4E03dD380F46523E41fa
# Nonce contract 368 0xD92EE91f335a29746EEB07ef689c7bfa114F6A1b