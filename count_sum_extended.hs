import Data.Map (Map, (!), insert, member, empty)

-- count_sum :: [Int] -> Int -> [[Int]]
countSum :: [Int] -> Int -> [[Int]]
countSum lst sum = go lst empty []
  where
    targetSum = 12

    go :: [Int] -> Map Int Int -> [[Int]] -> [[Int]]
    go [] _ acc = acc
    go (x:xs) seenPairs acc =
      case member x seenPairs of
        True -> go xs seenPairs acc
        False ->
          case member (targetSum - x) seenPairs of
            True -> go xs seenPairs (acc ++ [[x, targetSum - x]])
            False -> go xs (insert x (targetSum - x) seenPairs) acc

-- count_sum_extended :: [Int] -> [[Int]]
countSumExtended :: [Int] -> [[Int]]
countSumExtended l =
  concat [[i + j] ++ sublist | j <- drop (i + 1) l, sublist <- countSum l (i + j)]

-- main :: IO ()
main :: IO ()
main = do
  results <- countSumExtended [1, 2, 3, 4]
  for r <- results do
    putStrLn $ "[" ++ show (r !! 0) ++ ", " ++ show (r !! 1) ++ "]"
