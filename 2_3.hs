quicksort [] = []  
quicksort (x:xs) =   
    let smallerSorted = quicksort [a | a <- xs, a <= x]  
        biggerSorted = quicksort [a | a <- xs, a > x]  
    in  smallerSorted ++ [x] ++ biggerSorted  

myMedian [] = 0
myMedian (x:xs)
	|l == 1 = fromIntegral s
	|odd l = fromIntegral ((s:ss) !! m)
	|otherwise = (fromIntegral ((s:ss) !! m) + fromIntegral ((s:ss) !! (m-1))) / fromIntegral 2
	where (s:ss,l,m) = (quicksort (x:xs), length (s:ss), div (length (s:ss)) 2)