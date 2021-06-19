# Neokeon128
Implementation of the Neokeon block cipher
# Test vectors
key = b1656851 699e29fa 24b70148 503d2dfc <br />
ptxt = 2a78421b 87c7d092 4f26113f 1d1349b2 <br />

# Results from the software implementation 
## Test1
key = b1656851 699e29fa 24b70148 503d2dfc <br />
plaintext = 2a78421b 87c7d092 4f26113f 1d1349b2 <br />
ciphertext= e2f687e0 7b75660f fc372233 bc47532c <br />
## Test2 -  Ciphertext is new plaintext (test repeated 10 times)

key = b1656851 699e29fa 24b70148 503d2dfc <br />
plaintext = 2a78421b 87c7d092 4f26113f 1d1349b2 <br />

ciphertext= e2f687e0 7b75660f fc372233 bc47532c <br />
ciphertext= 28125138 9561a6ca 909dc19b c9877721 <br />
ciphertext= 24a73f9c f97a8690 e58f0d9c 39e063ab <br />
ciphertext= 092fcf45 be90dc32 8265a213 f492c0c3 <br />
ciphertext= f4e9d038 9dff8e11 86550bb2 d74bb700 <br />
ciphertext= 4594524a 797e9cc3 681065d3 911932cb <br />
ciphertext= 17e156b9 e538ccd3 05d3c2f4 0ab7195c <br />
ciphertext= b0ad49cd ed4e1c6e 3e135daa bf48c52a <br />
ciphertext= 42b94d2f e80456ad 113e335f b4fbb2ee <br />
ciphertext= 6fda512f 6f30bebc 81b60d00 d2782252 <br />

# Results from the FPGA implementation 
