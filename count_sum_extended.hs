import Data.Map (Map, member, insert, empty)
import Data.List (nub)

countSum :: [Int] -> Int -> [[Int]]
countSum lst targetSum = go lst empty []
  where
    go :: [Int] -> Map Int Int -> [[Int]] -> [[Int]]
    go [] _ acc = acc
    go (x:xs) seenPairs acc =
      case member x seenPairs of
        True -> go xs seenPairs acc
        False ->
          case member (targetSum - x) seenPairs of
            True -> go xs seenPairs (acc ++ [[x, targetSum - x]])
            False -> go xs (insert x (targetSum - x) seenPairs) acc

countSumExtended :: [Int] -> [[[Int]]]
countSumExtended lst =
  nub [ [i + j] : countSum lst (i + j) | i <- [0..length lst-1], j <- drop i lst, not (null (countSum lst (i + j))) ]

main :: IO ()
main = do
    print (countSumExtended [1, 2, 3, 4])
