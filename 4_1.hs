import Data.List

main = do 
	a <- getList
	putStrLn $ unlines $ sort a

getList = do 
	line <- getLine
	if null line 
		then return []
                else (do 
			a <- getList
                        return (line:a))




