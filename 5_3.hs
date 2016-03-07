import Data.Monoid
import Control.Applicative

data Point = Point Int Int deriving (Show)
data Maybe3 a = Just3 a | Unknown3 | Missing3 deriving (Show)

instance Monoid Point where  
    mempty = (Point 0 0)  
    (Point x1 y1) `mappend` (Point x2 y2) = Point (x1 + x2) (y1 + y2)

movePoint' :: Point -> Point -> Point
movePoint' (Point x1 y1) (Point x2 y2) = (Point x1 y1) `mappend` (Point x2 y2)

instance Monad Maybe3 where  
    return x = Just3 x  
    Missing3 >>= f = Missing3  
    Unknown3 >>= f = Unknown3  
    Just3 x >>= f  = f x  
    fail _ = Unknown3

--movePoint x y  = x >>= \z -> return (z + y)
movePoint :: Monad m => m Point -> Point -> m Point
movePoint a b = a >>= \z -> return(movePoint' z b)

{----Option 2
import Control.Monad

data Maybe3 a = Just3 a | Unknown3 | Missing3 deriving (Show)
data Point = Point (Maybe3 Int) (Maybe3 Int) deriving (Show)

instance Monad Maybe3 where  
    return x = Just3 x  
    Missing3 >>= f = Missing3  
    Unknown3 >>= f = Unknown3  
    Just3 x >>= f  = f x  
    fail _ = Unknown3

movePoint :: Point -> Int -> Int -> Point
movePoint (Point x1 y1) x2 y2  = Point (x1 >>= \z -> return(z + x2)) (y1 >>= \z -> return(z + y2))
--}