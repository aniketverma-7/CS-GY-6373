import Data.List

listPermutations :: [a] -> [[a]]
listPermutations = permutations --inbuild function of haskell

main = do
    let permutations = listPermutations [1, 2, 3]
    print permutations
