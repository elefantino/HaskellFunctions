myEvenSum[] = 0
myEvenSum (x:xs) = if mod x 2 == 0 then x + myEvenSum xs else myEvenSum xs
