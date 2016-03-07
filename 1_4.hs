myIntToList 0 = []
myIntToList x = myIntToList (div x 10) ++ [mod x 10]

myListToInt [] = 0
myListToInt (x:xs) = x * 10 ^ length xs + myListToInt xs
