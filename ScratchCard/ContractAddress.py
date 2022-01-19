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

developer= 0xdBc1ce93E1237baf2585CA87909B30A87A2E77B6
rainfund = 0xb3dedbe46f78032b9d7032ab5d7cf6c84e818c05
nonce = FindNonce(developer,rainfund)
print(nonce,getSon(developer,nonce),'start to predict',getSon(developer,nonce+1),getSon(developer,nonce+2))