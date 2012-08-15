-- same as 'length'
myLength :: [a] -> Int
myLength (x:xs) = 1 + myLength xs
myLength _ = 0

-- same as 'null'
myNull :: [a] -> Bool
myNull [] = True
myNull _ = False

-- same as 'head'
myHead :: [a] -> a
myHead (x:xs) = x
myHead _ = error "myHead takes a non-empty list"

mySafeHead :: [a] -> Maybe a
mySafeHead (x:xs) = Just x
mySafeHead _ = Nothing

-- same as 'tail'
myTail :: [a] -> [a]
myTail (x:xs) = xs
myTail _ = error "myTail takes a non-empty list"

-- same as 'last'
myLast :: [a] -> a
myLast [x] = x
myLast (x:xs) = myLast xs

-- same as 'init'
myInit :: [a] -> [a]
myInit [x] = []
myInit (x:xs) = x : myInit xs

-- same as '(++)'
myAppend :: [a] -> [a] -> [a]
myAppend [] b = b
myAppend a [] = a
myAppend a b = myAppend (myInit a) ((myLast a) : b)
