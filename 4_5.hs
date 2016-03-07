data Bool3 = True3 | False3 | Unk3 deriving (Eq, Show)
data Maybe3 a = Just3 a | Unknown3 | Missing3 deriving (Show)

(&&&) :: Bool3 -> Bool3 -> Bool3
(&&&) x y
 | x == True3 && y == True3 = True3
 | x == False3 || y == False3 = False3
 |otherwise = Unk3

(|||) :: Bool3 -> Bool3 -> Bool3
(|||) x y
 | x == True3 || y == True3 = True3
 | x == False3 && y == False3 = False3
 |otherwise = Unk3

not3 :: Bool3 -> Bool3
not3 x
 | x == True3 = False3
 | x == False3 = True3
 |otherwise = Unk3

eq3 :: (Eq a) => Maybe3 a -> Maybe3 a -> Bool3
eq3 Missing3 _ = False3
eq3 _ Missing3 = False3
eq3 Unknown3 _ = Unk3
eq3 _ Unknown3 = Unk3
eq3 (Just3 x) (Just3 y) = if (x==y) then True3 else False3