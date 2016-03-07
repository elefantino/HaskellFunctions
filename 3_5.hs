import qualified Data.Map as Map

phoneBookToMap xs = Map.fromList xs

findPhone name xs = Map.lookup name $ phoneBookToMap xs

findName phone xs = Map.lookup phone $ phoneBookToMap $ [(b,a)|(a,b) <- xs]

addRecord (name, phone) xs = Map.insert name phone $ phoneBookToMap xs

