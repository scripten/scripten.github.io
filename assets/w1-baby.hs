doubleme x = x + x

doubleus x y = doubleme x + doubleme y

doubleSmallNumber x = if x < 100 then x*2 else x

doubleList = [doubleme x | x <- [1..10]]

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

zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]  
zipWith' _ [] _ = []  
zipWith' _ _ [] = []  
zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys

quicksort :: (Ord a) => [a] -> [a]  
quicksort [] = []  
quicksort (x:xs) =   
    let smallerSorted = quicksort (filter (<=x) xs)
        biggerSorted = quicksort  (filter (>x) xs)
    in  smallerSorted ++ [x] ++ biggerSorted

data Person = Person { firstName :: String  
                     , lastName :: String  
                     , age :: Int  
                     } deriving (Eq, Show)

