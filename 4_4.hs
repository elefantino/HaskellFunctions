data Bool3 = True3 | False3 | Unk3 deriving (Show)

and3 :: Bool3 -> Bool3 -> Bool3
and3 a b = case (a,b) of 
    (True3, True3) -> True3  
    (True3, Unk3)  -> Unk3  
    (Unk3,  True3) -> Unk3  
    (Unk3,  Unk3)  -> Unk3  
    otherwise      -> False3 

or3 :: Bool3 -> Bool3 -> Bool3
or3 a b = case (a,b) of 
    (False3, False3) -> False3  
    (False3, Unk3)   -> Unk3  
    (Unk3,   False3) -> Unk3  
    (Unk3,   Unk3)   -> Unk3  
    otherwise        -> True3 

not3 :: Bool3 -> Bool3
not3 a = case a of 
    False3 -> True3  
    Unk3   -> Unk3  
    True3  -> False3