# Neokeon128
Implementation of the Neokeon block cipher
# Test vectors
key = b1656851 699e29fa 24b70148 503d2dfc <br />
ptxt = 2a78421b 87c7d092 4f26113f 1d1349b2 <br />

# Results from the software implementation 
## Test1 - Ciphering
key = b1656851 699e29fa 24b70148 503d2dfc <br />
plaintext = 2a78421b 87c7d092 4f26113f 1d1349b2 <br />
ciphertext= e2f687e0 7b75660f fc372233 bc47532c <br />
## Test2 -Ciphering of ciphertext as new plaintext (test repeated 10 times)

![image](https://user-images.githubusercontent.com/45511879/122646208-4f9f5c00-d11e-11eb-8232-ca981147e2f5.png)

# Results from the FPGA implementation (Modelsim)
## Test1 - Ciphering (TbNeokeon)
![image](https://user-images.githubusercontent.com/45511879/122646356-00a5f680-d11f-11eb-9b71-3389430d0140.png)

## Test2 -Ciphering of ciphertext as new plaintext (test repeated 10 times)(TbNeokeon10)
![image](https://user-images.githubusercontent.com/45511879/122646470-96418600-d11f-11eb-8180-6ceba8daa276.png)
![image](https://user-images.githubusercontent.com/45511879/122646490-a9545600-d11f-11eb-8b01-3e810dcdcadc.png)
<br />
results are the same.

