import Palindromes
import Data.List

longestPalindrome xs = longest $ filter isPalindrome $ substrings xs

showPalindromes xs n = freq $ sort $ allPalindromes xs n






 