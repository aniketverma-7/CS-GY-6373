import Data.List (nub)

union :: (Eq a) => [a] -> [a] -> [a]
union l1 l2 = nub (l1 ++ l2)

main = do
    print (union [12,17,73,34,82] [5 1 79])