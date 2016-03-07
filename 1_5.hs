find_v xs = sum (zipWith (*) (reverse xs) (cycle[7,3,1]))
find_v1 xs = if div v 10 == 0 then 0 else div v 10 *10 +10 - v
	where v = find_v xs


myFBTRN[] = []
myFBTRN xs = xs ++ [find_v1 xs]
