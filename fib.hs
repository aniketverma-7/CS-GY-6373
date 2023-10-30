import Control.Monad.State

data FibState = FibState
  { n0 :: Integer
  , n1 :: Integer
  }

type FibStateful a = State FibState a

fibonacci :: FibStateful Integer
fibonacci = do
  state <- get
  let p1 = n0 state
  let p2 = n1 state
  let c = p1 + p2
  put $ FibState c p1
  return c

fib :: Int -> FibStateful [Integer]
fib n = sequence $ replicate n fibonacci

main :: IO ()
main = do
  let n = 50
  let initialState = FibState 1 0
  let (fibSeries, _) = runState (fib n) initialState
  print (fibSeries !! (n-1))
  print(fibSeries)