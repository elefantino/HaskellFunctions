myOther [] = []
myOther [x] = [x]
myOther (x:y:xs) = x : myOther xs
