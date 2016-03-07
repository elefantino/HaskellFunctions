data Bool3 = True3 | False3 | Unk3 deriving (Show)
data Maybe3 = Just3 Int | Missing3 | Unknown3 deriving (Show)

class YesNoMaybe a where
	yesnomaybe :: a -> Bool3

instance YesNoMaybe (Maybe3) where
	yesnomaybe Unknown3 = Unk3
	yesnomaybe Missing3 = False3
	yesnomaybe _ = True3 