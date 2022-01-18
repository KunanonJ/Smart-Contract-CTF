import rlp
from eth_utils import keccak, to_checksum_address, to_bytes
def mk_contract_address(sender, nonce):
        sender_bytes = to_bytes(hexstr=sender)
        raw = rlp.encode([sender_bytes, nonce])
        h = keccak(raw)
        address_bytes = h[12:]
        return to_checksum_address(address_bytes)

for x in range(1,2):
        addr = mk_contract_address("0xc0FafEb583F141ac81ADBadd186088DdA9FCb759",x)
        print(f"nonce: {x} contract: {addr}")
#from 0xa3780318e697c03bd89397cda5521a158439991b
#Launcher Address is 0xeD0D5160c642492b3B482e006F67679F5b6223A2
#RainyDayFund Nouce 459 0xc0FafEb583F141ac81ADBadd186088DdA9FCb759
#DebugAuthorizer Nouce 1 0x1a9Da89b81154808Ecd3BfD0A6F4fc1c85101c71