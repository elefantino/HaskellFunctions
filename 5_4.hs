import System.Random

randoms' :: (Num a, RandomGen g, Random a) => g -> [a]
randoms' gen = let (value, newGen) = randomR (-10,10) gen in value:randoms' newGen

genList :: Int -> Int -> [Int]
genList n g = take n $ randoms' (mkStdGen g)

myPairs :: Int -> [(Int, Int)]
myPairs n = zip (genList n (n*100)) (genList n (n*200))