from ethereum import utils

def getSon(Father,nonce):
    sha3_res = utils.mk_contract_address(Father,nonce)
    sha3_res_de = utils.decode_addr(sha3_res)
    #print('[+]%s,contract_address: %s'%(nonce,sha3_res_de))
    return(sha3_res_de)

def FindNonce(Father,Son):
    MaxNonce = 100000
    for nonce in range(MaxNonce):
        res = getSon(Father,nonce)
        if int(res,16)==Son:
            print('[+]the correct nonceis :%s'%(nonce))
            return(int(nonce))

developer= 0x43065950E0185BD74361D8580Daaa5BFF806aaDE
rainfund = 0x505d51adcccb62cd33579c1ea7b94a717f7ae06e
nonce = FindNonce(developer,rainfund)
print(nonce,getSon(developer,nonce),'start to predict',getSon(developer,nonce+1),getSon(developer,nonce+2))