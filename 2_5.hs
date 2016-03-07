--predicative for the filter: if it is palindrome
palindrome xs = xs == reverse xs

--create a list of all possible substrings
--example function to test the division
substrings1' []     = []
substrings1' (y:ys) = [y] : [ (y:s) | s <- substrings1' ys ]

substrings []     = []
substrings (x:xs) = substrings' (x:xs) ++ substrings xs where
	substrings' []     = []
	substrings' (y:ys) = [y] : [ (y:s) | s <- substrings' ys ]

--find the longest substring in the list
longest []     = []
longest (x:xs) = if length x > length max then x else max
	where max = longest xs

longestPalindrome xs = longest (filter palindrome (substrings xs))






 