module Ch1 where

import Data.List

duplicateRemovals :: String -> String
duplicateRemovals = go []
  where
    go stack [] = reverse stack
    go [] (x:xs) = go [x] xs
    go (s:stack) (x:xs)
      | s == x = go stack xs
      | otherwise = go (x:s:stack) xs
    
main :: IO ()
main = do
  print $ duplicateRemovals "abbaca"
  print $ duplicateRemovals "azxxzy"
  print $ duplicateRemovals "aaaaaaaa"
  print $ duplicateRemovals "aabccba"
  print $ duplicateRemovals "abcddcba"

