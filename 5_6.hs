import Data.Monoid
import Control.Applicative
import System.Random
import System.IO
import System.Environment

data Point = Point Int Int deriving (Show, Eq)
data Maybe3 a = Just3 a | Unknown3 | Missing3 deriving (Show, Eq)

--Maybe3 and Point functions
notXY :: Int -> Int -> Maybe3 Point -> Bool
notXY x y (Just3 (Point x1 y1)) = if (x == x1) && (y == y1) then False else True

genPoint3 :: Int -> Int -> Maybe3 Point
genPoint3 x y = Just3 (Point x y)

--helping functions
randoms' :: (Num a, RandomGen g, Random a) => g -> [a]
randoms' gen = let (value, newGen) = randomR (-10,10) gen in value:randoms' newGen

genRandomList :: Int -> [Int]
genRandomList n = take (n*2) $ randoms' (mkStdGen n)

genRandompoint :: Maybe3 Point
genRandompoint = Just3 (Point a b)
	where [a,b] = take 2 $ randoms' (mkStdGen 1)
	      
--command functions
generateList :: [Int] -> [Maybe3 Point]
generateList [] = []
generateList (a:b:xs) = (Just3 (Point a b)) : (generateList xs)

doBreak :: Int -> Int -> [Maybe3 Point] -> [Maybe3 Point]
doBreak _ _ [] = []
doBreak x y (z:zx) = if (z == Missing3) || (z == Unknown3) || (notXY x y z) then z:doBreak x y zx 
	else Missing3:doBreak x y zx

doLose :: Int -> Int -> [Maybe3 Point] -> [Maybe3 Point]
doLose _ _ [] = []
doLose x y (z:zx) = if (z == Missing3) || (z == Unknown3) || (notXY x y z) then z:doLose x y zx 
	else Unknown3:doLose x y zx

doInit :: [Maybe3 Point] -> [Maybe3 Point]
doInit [] = []
doInit (z:zx) = if (z == Unknown3) then (genPoint3 0 0):doInit zx else z:doInit zx

doRandomwalk :: [Maybe3 Point] -> [Maybe3 Point]
doRandomwalk [] = []
doRandomwalk (z:zx) = if (z == Missing3) || (z == Unknown3) then z:doRandomwalk zx 
	else (genRandompoint):doRandomwalk zx

{--
main = do
	(n:_) <- getArgs
	putStrLn $ "Write a command: print, break x y, lose x y, init, randomwalk"
	inp <- getLine
	xs <- generateList $ genRandomList n
   	putStr "\n"
   	outp <- case inp of
        	print -> PutStrLn xs
                break x y -> doBreak x y xs
                lose x y -> doLose x y xs
		init -> doInit xs
		randomwalk -> doRandomwalk xs
                _   -> putStrLn $ "Not a recognised command"
        putStrLn outp 
--}
