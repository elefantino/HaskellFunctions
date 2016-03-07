import System.IO
import System.Exit
import qualified Data.Map as Map

--phoneBookToMap xs = Map.fromList xs
--findPhone name xs = Map.lookup name $ phoneBookToMap xs
--findName phone xs = Map.lookup phone $ phoneBookToMap $ [(b,a)|(a,b) <- xs]

findPhone db = do
   putStr "name: "
   name <- getLine
   putStrLn $ case Map.lookup name db of
                Nothing -> "Not found"
                Just phone -> phone

findName db = do
   putStr "phone: "
   phone <- getLine
   putStrLn $ case Map.lookup phone db of
                Nothing -> "Not found"
                Just name -> name

-- interacting with the user. 
mainLoop db = do
   putStr "Command [npq]: "
   c <- getChar
   putStr "\n"
   db' <- case c of
            'n' -> do findPhone db; return (Just db)
            'p' -> do findName db; return (Just db)
            'q' -> return Nothing
            _   -> do putStrLn $ "Not a recognised command"
                      return (Just db)
   maybe (return db) mainLoop db'

parseMap = foldr parseLine Map.empty . lines
     where parseLine ln map = 
             let [n, p] = words ln
             in Map.insert n p map

showMap = unlines . map (\(n, p) -> n ++ " " ++ p) . Map.toAscList

main = do
	putStrLn $ "Write a command: n - find a phone by name, p - find a name by phone, q - quit"
   	dbFile <- readFile "myBook.txt"
   	db'    <- mainLoop (parseMap dbFile)
	writeFile "myBook.txt" (showMap db')




