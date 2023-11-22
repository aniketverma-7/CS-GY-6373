import Data.Map (Map, (!), insert, member, empty)

countSum :: [Int] -> [[Int]]
countSum lst = go lst empty []
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

main :: IO ()
main = print (countSum [1, 3, 8, 12, 7, 11, 9, 4, 2, 10, 5])
