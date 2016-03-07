--predicative for the filter: if it is palindrome
palindrome xs = xs == reverse xs

--create a list of all possible substrings
substrings []     = []
substrings (x:xs) = substrings' (x:xs) ++ substrings xs where
	substrings' []     = []
	substrings' (y:ys) = [y] : [ (y:s) | s <- substrings' ys]

--leave palindromes of >= n length
allPalindromes xs n = filter palindrome (filter (\xs -> length xs >= n) (substrings xs))

--sorting
quicksort [] = []  
quicksort (x:xs) =   
    let smallerSorted = quicksort [a | a <- xs, a <= x]  
        biggerSorted = quicksort [a | a <- xs, a > x]  
    in  smallerSorted ++ [x] ++ biggerSorted

--find frequencies: "freq" returns the list with tuples (frequency,x), retrived from 2.4 task
freq []     = []
freq (x:xs) = freq' 1 x xs where
    freq' n x [] = [(n, x)]
    freq' n x (y:ys)
        | x == y    = freq' (n + 1) x ys
        | otherwise = (n, x) : freq' 1 y ys

showPalindromes xs n = freq (quicksort (allPalindromes xs n))




 