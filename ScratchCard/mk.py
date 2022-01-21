import rlp
from eth_utils import keccak, to_checksum_address, to_bytes
def mk_contract_address(sender, nonce):
        sender_bytes = to_bytes(hexstr=sender)
        raw = rlp.encode([sender_bytes, nonce])
        h = keccak(raw)
        address_bytes = h[12:]
        return to_checksum_address(address_bytes)

for x in range(386, 388):
        addr = mk_contract_address("0x43065950E0185BD74361D8580Daaa5BFF806aaDE", x)
        print(f"Nonce: {x} contract: {addr}")
#Attacker address 0x43065950E0185BD74361D8580Daaa5BFF806aaDE
#Launcher Address is 0x505d51adcccb62cd33579c1ea7b94a717f7ae06e
# Nonce: 386 contract: 0xA12EE11034ba9607A708234579Ab24561388C210
# Nonce: 387 contract: 0x6B8248aEd8efaF96680E94EaC419bc72Cc72AB84
