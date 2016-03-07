myF32 [] = 0
myF32 (x:xs) = sum $ map (\x -> if odd x then 0 else x) (x:xs)

