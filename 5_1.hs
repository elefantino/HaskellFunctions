import Data.Monoid
	
data Point = Point Int Int deriving (Show)

instance Monoid Point where  
    mempty = (Point 0 0)  
    (Point x1 y1) `mappend` (Point x2 y2) = Point (x1 + x2) (y1 + y2)

movePoint :: Point -> Int -> Int -> Point
movePoint (Point x1 y1) x2 y2 = (Point x1 y1) `mappend` (Point x2 y2)