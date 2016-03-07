import System.Environment
import Control.Concurrent

main = do
	args <- getArgs
	let (a,b) | null args = (1,2)
		  | otherwise = (read $ head args, read $ last args) 	
	x <- newMVar a
	y <- newMVar b
	x' <- newMVar a
	y' <- newMVar b
	forkIO $ do
		a <- takeMVar x
		b <- takeMVar y
		putMVar x (a^b)
	forkIO $ do
		a' <- takeMVar x'
		b' <- takeMVar y'
		putMVar y (b'^a')
	threadDelay 2000
	x' <- takeMVar x
	y' <- takeMVar y
	if x' > y' then print $ "a^b is bigger" else print $ "b^a is bigger"
	print (x')
	print (y')	
