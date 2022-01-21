from ethereum import utils


def getSon(Father, nonce):
    sha3_res = utils.mk_contract_address(Father, nonce)
    sha3_res_de = utils.decode_addr(sha3_res)
    # print('[+]%s,contract_address: %s'%(nonce,sha3_res_de))
    return (sha3_res_de)


def FindNonce(Father, Son):
    MaxNonce = 100000
    for nonce in range(MaxNonce):
        res = getSon(Father, nonce)
        if int(res, 16) == Son:
            print('[+] the correct nonce is :%s' % nonce)
            return int(nonce)


developer = 0xdBc1ce93E1237baf2585CA87909B30A87A2E77B6
scratchcard = 0x505D51AdcCcB62Cd33579C1EA7B94a717F7aE06e
nonce = FindNonce(developer, scratchcard)
print(nonce, getSon(developer, nonce), 'start to predict', getSon(developer, nonce + 1), getSon(developer, nonce + 2))
