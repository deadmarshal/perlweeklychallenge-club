string == [char]

duplicateRemovals :: string -> string
duplicateRemovals = go []
                    where
  		      go stack [] = reverse stack
		      go [] (x:xs) = go [x] xs
		      go (s:stack) (x:xs) = go stack xs,if s == x
		                          = go (x:s:stack) xs,otherwise

