findMinMax :: (Ord a) => [a] -> (a, a)
findMinMax xs = (minimum xs, maximum xs)

main = do
    let list = [22,5,39,37,18,89,97,66,76,55]
    let (minValue, maxValue) = findMinMax list
    putStrLn $ "Minimum: " ++ show minValue
    putStrLn $ "Maximum: " ++ show maxValue
