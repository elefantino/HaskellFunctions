quicksort [] = []  
quicksort (x:xs) =   
    let smallerSorted = quicksort [a | a <- xs, a <= x]  
        biggerSorted = quicksort [a | a <- xs, a > x]  
    in  smallerSorted ++ [x] ++ biggerSorted

--find frequencies: "freq" returns the list with tuples (frequency,x), works properly on sorted lists
freq []     = []
freq (x:xs) = freq' 1 x xs where
    freq' n x [] = [(n, x)]
    freq' n x (y:ys)
        | x == y    = freq' (n + 1) x ys
        | otherwise = (n, x) : freq' 1 y ys

--find element with maximum frequency
myF (x:xs) = 
	let (a,b) = maximum (freq (quicksort(x:xs)))
	in b


 