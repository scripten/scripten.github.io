doubleme x = x + x

doubleus x y = doubleme x + doubleme y

doubleSmallNumber x = if x < 100 then x*2 else x

doubleList l = [doubleme x | x <- [1..10]]

boomBangs xs = [ if x < 10 then "BOOM!" else "BANG!" | x <- xs, odd x]

removeNonUppercase :: [Char] -> [Char]
removeNonUppercase st = [ c | c <- st, c `elem` ['A'..'Z']]

head' :: [a] -> a  
head' [] = error "Can't call head on an empty list!"  
head' (x:_) = x

initials :: String -> String -> String
initials firstName lastName = [f] ++ ". " ++ [l] ++ "."
  where (f:_) = firstName
        (l:_) = lastName
