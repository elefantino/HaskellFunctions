import Control.Monad.Writer
import Data.Monoid

--DiffList
newtype DiffList a = DiffList { getDiffList :: [a] -> [a] }  

instance Monoid (DiffList a) where  
    mempty = DiffList (\xs -> [] ++ xs)  
    (DiffList f) `mappend` (DiffList g) = DiffList (\xs -> f (g xs))

toDiffList :: [a] -> DiffList a  
toDiffList xs = DiffList (xs++)  
  
fromDiffList :: DiffList a -> [a]  
fromDiffList (DiffList f) = f []

--create a list of all possible substrings
substrings []     = []
substrings (x:xs) = substrings' (x:xs) ++ substrings xs where
	substrings' []     = []
	substrings' (y:ys) = [y] : [ (y:s) | s <- substrings' ys]

--leave palindromes of >= n length
allPalindromes xs n = filter (\xs -> (xs == reverse xs) && (length xs >= n)) (substrings xs)

--we have a list of palindromes of a minimum length and call longest [list] ml ""
longest [] ml mp = do return mp
longest (x:xs) ml mp
	| length x > length mp = do
		tell (toDiffList ["Palindrome " ++ x])
		longest xs (length x) x
	| length x <= length mp = do
		tell (toDiffList ["Palindrome " ++ x])
		longest xs (length mp) mp 

longestPalindrome :: String -> Int -> (String, [String])
longestPalindrome (x:xs) n = ("The longest palindrome is " ++ (fst.runWriter $ a), fromDiffList.snd.runWriter $ a) 
	where a = longest (allPalindromes (x:xs) n) n ""
