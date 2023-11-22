import Data.List (tails)
import Data.Map (Map, (!), insert, member, empty)

countSum :: [Int] -> Int -> [[Int]]
countSum lst targetSum= go lst empty []
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

countSumExtended :: [Int] -> [(Int, [Int])]
countSumExtended lst =
  concat [(countSum lst (i + j)) | (i:rest) <- tails lst, j <- rest]

main :: IO ()
main = mapM_ print (countSumExtended [1, 2, 3, 4])
