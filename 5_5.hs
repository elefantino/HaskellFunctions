import Data.Monoid
import Control.Applicative
import System.Random

--help functions
data Point = Point Int Int deriving (Show)
data Maybe3 a = Just3 a | Unknown3 | Missing3 deriving (Show)

instance Monoid Point where  
    mempty = (Point 0 0)  
    (Point x1 y1) `mappend` (Point x2 y2) = Point (x1 + x2) (y1 + y2)

instance Monad Maybe3 where  
    return x = Just3 x  
    Missing3 >>= f = Missing3  
    Unknown3 >>= f = Unknown3  
    Just3 x >>= f  = f x  
    fail _ = Unknown3

movePoint' :: Point -> Point -> Point
movePoint' (Point x1 y1) (Point x2 y2) = (Point x1 y1) `mappend` (Point x2 y2)

instance Functor Maybe3 where
	fmap f (Just3 x) = Just3 (f x)
	fmap _ Missing3 = Missing3
	fmap _ Unknown3 = Unknown3

instance Applicative Maybe3 where
	pure = Just3
	Missing3 <*> _ = Missing3
	Unknown3 <*> _ = Unknown3
	(Just3 f) <*> something = fmap f something

movePoint :: Monad m => m Point -> Point -> m Point
movePoint a b = a >>= \z -> return(movePoint' z b)

randoms' :: (Num a, RandomGen g, Random a) => g -> [a]
randoms' gen = let (value, newGen) = randomR (-10,10) gen in value:randoms' newGen

genList :: Int -> Int -> [Int]
genList n g = take n $ randoms' (mkStdGen g)

myPairs :: Int -> [(Int, Int)]
myPairs n = zip (genList n (n*100)) (genList n (n*200))

myPoints :: [(Int, Int)] -> [Point]
myPoints [] = []
myPoints ((a,b):xs) = (Point a b) : (myPoints xs)

myFunction' :: Monad m => [m Point] -> [Point] -> [m Point]
myFunction' [] _ = []
myFunction' _ [] = []
myFunction' (x:xs) (y:ys) = (movePoint x y) : myFunction' xs ys

--main function
myFunction :: Monad m => [m Point] -> [m Point]
myFunction xs = myFunction' xs (myPoints $ myPairs $ length xs)


{----Option 2
import System.Random

data Point = Point Int Int deriving (Show)
data Maybe3 a = Just3 a | Unknown3 | Missing3 deriving (Show)

randoms' :: (Num a, RandomGen g, Random a) => g -> [a]
randoms' gen = let (value, newGen) = randomR (-10,10) gen in value:randoms' newGen

genList :: Int -> Int -> [Int]
genList n g = take n $ randoms' (mkStdGen g)

myPairs :: Int -> [(Int, Int)]
myPairs n = zip (genList n (n*100)) (genList n (n*200))

myFunction xs = zip xs (myPairs (length xs))
--}
