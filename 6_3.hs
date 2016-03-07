import Control.Monad

type Stack = [Int] 

newtype State s a = State { runState :: s -> (a,s) }  

instance Monad (State s) where  
    return x = State $ \s -> (x,s)  
    (State h) >>= f = State $ \s -> let (a, newState) = h s  
                                        (State g) = f a  
                                    in  g newState
pop :: State [a] a  
pop = State $ \(x:xs) -> (x,xs)  
  
push :: a -> State [a] () 
push a = State $ \xs -> ((),a:xs)

--e.g. runState addStuff [1,2,3,4]
addStuff :: State [Integer] () 
addStuff = do
	a <- pop
	b <- pop
	push (b + a)

multStuff :: State [Integer] ()
multStuff = do
	a <- pop
	b <- pop
	push (b * a)

divStuff :: State [Double] ()
divStuff = do
	a <- pop
	b <- pop
	push (b/a)

subStuff :: State [Integer] () 
subStuff = do
	a <- pop
	b <- pop
	push (b - a)

