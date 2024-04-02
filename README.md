# 16-bit signed Booth Multiplier
This particular implementation is a high-performance pipelined 16*16bit Booth Multiplier with a 5-stage Wallace tree Structure. It is released subject to the terms of the MIT License which can be found in this distribution of the Verilog code in a file called LICENSE.

# Booth Algorithm and Encoding
We can write an n-bit signed binary number in the following format-1:   
  
![image](https://github.com/salzhang/16-bit-signed-Booth-Multiplier/assets/157662799/9fd97113-2bf5-435b-9d5e-a1e3cd3bc38e)  
We can also write it in format-2:  
  
![image](https://github.com/salzhang/16-bit-signed-Booth-Multiplier/assets/157662799/5ef45efc-8915-45bb-a316-cfeeb2d00de6)  

Or format-3:  

![image](https://github.com/salzhang/16-bit-signed-Booth-Multiplier/assets/157662799/dee7b2f0-33e9-4c9a-b264-1dff5665c83b)

In format-3, we can successfully "halfen" the number of addtion by applying this truth table:

![image](https://github.com/salzhang/16-bit-signed-Booth-Multiplier/assets/157662799/60096494-f701-4692-8ab3-45a15aedbe95)  

# Wallace Tree  
![872496817483314438](https://github.com/salzhang/16-bit-signed-Booth-Multiplier/assets/157662799/882b761c-fc30-4c27-a713-9e70624d530e)

# Reference
Reference: https://zhuanlan.zhihu.com/p/127164011




