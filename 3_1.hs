f x = if odd x then 0 else x

myF [] = 0
myF (x:xs) = sum $ map f (x:xs)

