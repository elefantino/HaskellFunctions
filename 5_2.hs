import Data.Monoid
import Control.Applicative

data Point = Point Int Int deriving (Show)
data Maybe3 a = Just3 a | Unknown3 | Missing3 deriving (Show)

instance Monoid Point where  
    mempty = (Point 0 0)  
    (Point x1 y1) `mappend` (Point x2 y2) = Point (x1 + x2) (y1 + y2)

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

--movePoint x y  = pure (+) <*> y <*> x
movePoint :: Applicative f => f Point -> f Point -> f Point
movePoint a b = pure (movePoint') <*> b <*> a

{----Option 2
import Control.Applicative

data Maybe3 a = Just3 a | Unknown3 | Missing3 deriving (Show)
data Point = Point (Maybe3 Int) (Maybe3 Int) deriving (Show)

instance Functor Maybe3 where
	fmap f (Just3 x) = Just3 (f x)
	fmap _ Missing3 = Missing3
	fmap _ Unknown3 = Unknown3

instance Applicative Maybe3 where
	pure = Just3
	Missing3 <*> _ = Missing3
	Unknown3 <*> _ = Unknown3
	(Just3 f) <*> something = fmap f something

movePoint :: Point -> Point -> Point
movePoint (Point x1 y1) (Point x2 y2)  = Point (pure (+) <*> x2 <*> x1) (pure (+) <*> y2 <*> y1)
--}