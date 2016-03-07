import Data.Char

--Vigenere cipher and decipher for string (s) with key (k)
--c = (s + k) mod 26, d = (s - k) mod 26
--s and k in 'a..z'

-- convert letter to number (-97)
toInt l = ord l - ord 'a'
 
-- convert number to letter (+97)
toChr n = chr (n + ord 'a')
 
encode key string = [toChr ((toInt s + toInt k) `mod` 26) | (k,s) <- zip (cycle key) string]
decode key string = [toChr ((toInt s - toInt k) `mod` 26) | (k,s) <- zip (cycle key) string]
 
 
 
