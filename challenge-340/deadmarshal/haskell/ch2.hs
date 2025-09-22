module Ch2 where

import Data.Char

isAscending :: Integral a => [a] -> Bool
isAscending [] = True
isAscending [x] = True
isAscending (x:y:xs) = x < y && isAscending (y:xs)

ascendingNumbers :: String -> Bool
ascendingNumbers str = isAscending l
  where
    l = map read $ filter (all isDigit) $ words str

main :: IO ()
main = do
  print $ ascendingNumbers "The cat has 3 kittens 7 toys 10 beds"
  print $ ascendingNumbers "Alice bought 5 apples 2 oranges 9 bananas"
  print $ ascendingNumbers "I ran 1 mile 2 days 3 weeks 4 months"
  print $ ascendingNumbers "Bob has 10 cars 10 bikes"
  print $ ascendingNumbers "Zero is 0 one is 1 two is 2"

