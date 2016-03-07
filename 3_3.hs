combineWith _ _ [] _ = []
combineWith _ _ _ [] = []
combineWith p f (x:xs) (y:ys) = if p x y then f x y : combineWith p f xs ys else combineWith p f xs ys
