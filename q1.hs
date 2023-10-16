list_reverse :: [l] -> [l]
list_reverse (n:n1) = list_reverse n1 ++ [n]
list_reverse [] = []
main = do
    print (list_reverse [12,17,73,34,82])
 