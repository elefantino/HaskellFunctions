mySort1 m [] ys = m:mySort ys
mySort1 m (x:xs) ys = if m<x then (mySort1 m xs (x:ys)) else (mySort1 x xs (m:ys)) 
mySort [] = []
mySort (x:xs) = mySort1 x xs []
