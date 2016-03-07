fPhone name db = [phone | (n, phone) <- db, n == name]
fName phone db = [name | (name, n) <- db, n == phone]

findPhone name [] = "None"
findPhone name db = if f == [] then "None" else head(f)
	where f = fPhone name db

findName phone [] = "None"
findName phone db = if f == [] then "None" else head(f)
	where f = fName phone db

addRecord (name,phone) db = if fPhone name db == [] && fName phone db == [] then (name, phone):db else db 



