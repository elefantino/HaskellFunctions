import Control.Monad.Writer

--create a list of all possible substrings
substrings []     = []
substrings (x:xs) = substrings' (x:xs) ++ substrings xs where
	substrings' []     = []
	substrings' (y:ys) = [y] : [ (y:s) | s <- substrings' ys]

--leave palindromes of >= n length
allPalindromes xs n = filter (\xs -> (xs == reverse xs) && (length xs >= n)) (substrings xs)

--we have a list of palindromes of a minimum length and call longest [list] ml ""
longest :: [String] -> Int -> String -> Writer [String] String
longest [] ml mp = do return mp
longest (x:xs) ml mp
	| length x > length mp = do
		tell ["Palindrome " ++ x]
		longest xs (length x) x
	| length x <= length mp = do
		tell ["Palindrome " ++ x]
		longest xs (length mp) mp 

longestPalindrome :: String -> Int -> (String, [String])
longestPalindrome (x:xs) n = runWriter $ longest (allPalindromes (x:xs) n) n ""
