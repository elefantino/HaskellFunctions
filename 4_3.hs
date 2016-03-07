import Data.Char
import System.Environment

--Vigenere cipher and decipher for string (s) with key (k)
--c = (s + k) mod 26, d = (s - k) mod 26
--s and k in 'a..z'

calcVigB f (x,k) = (chr $ minChar + (posDif f x k))
  where minChar = ord 'a'
        maxChar = ord 'z'
        posDif f x k = (f (pos x)  (pos k)) `mod` charNo
        pos c = ord c - minChar
        charNo = maxChar - minChar + 1
 
encode key message = map (calcVigB (+)) $ zip message $ cycle key
decode key message = map (calcVigB (-)) $ zip message $ cycle key

main = do
	line <- getLine
	key <- getArgs
	let c = encode (key!!0) line
	    d = decode (key!!0) line
	putStrLn ("Ciphered message is " ++ c)
	putStrLn ("Deciphered message is " ++ d)
 
 
 
