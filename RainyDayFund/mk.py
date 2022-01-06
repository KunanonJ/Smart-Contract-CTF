import rlp
from eth_utils import keccak, to_checksum_address, to_bytes
def mk_contract_address(sender, nonce):
        sender_bytes = to_bytes(hexstr=sender)
        raw = rlp.encode([sender_bytes, nonce])
        h = keccak(raw)
        address_bytes = h[12:]
        return to_checksum_address(address_bytes)

for x in range(453,454):
        addr = mk_contract_address("0x1F5e01FA5185F3F885401F219064aB2BF7CDFe6A",x)
        print(f"nonce: {x} contract: {addr}")

#1st level contract is 0x66dAA786c6bE11b19B4A3F74f8f20a5630369fd1
#2nd DebugAuthorizer contract is 0x1F5e01FA5185F3F885401F219064aB2BF7CDFe6A