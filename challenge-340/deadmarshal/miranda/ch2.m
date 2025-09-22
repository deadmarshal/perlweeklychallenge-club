string == [char]

words :: string->[string]
words [] = []
words s = word : words rest
      	  where
	    word = takewhile (~=' ') (dropwhile (=' ') s)
	    rest = dropwhile (=' ') (dropwhile (~=' ') s)

isDigit :: char->bool
isDigit c = True,if 48 <= cc & cc <= 57
	  = False,otherwise
	    where cc = code(c)

all :: (*->bool)->[*]->bool
all f xs = and [f x | x <- xs]

isAscending :: [*] -> bool
isAscending [] = True
isAscending [x] = True
isAscending (x:y:xs) = x < y & isAscending (y:xs)

ascendingNumbers :: string -> bool
ascendingNumbers str = isAscending l
		       where
			l = map numval (filter (all isDigit) strs)
			strs = (words str)

