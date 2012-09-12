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

safeHead :: [a] -> Maybe a
safeHead (x:xs) = Just x
safeHead _ = Nothing

-- same as 'tail'
myTail :: [a] -> [a]
myTail (x:xs) = xs
myTail _ = error "myTail takes a non-empty list"

safeTail :: [a] -> Maybe [a]
safeTail (x:xs) = Just xs
safeTail _ = Nothing

-- same as 'last'
myLast :: [a] -> a
myLast [x] = x
myLast (x:xs) = myLast xs

safeLast :: [a] -> Maybe a
safeLast [x] = Just x
safeLast (x:xs) = safeLast xs
safeLast _ = Nothing

-- same as 'init'
myInit :: [a] -> [a]
myInit [x] = []
myInit (x:xs) = x : myInit xs

safeInit :: [a] -> Maybe [a]
safeInit [x] = Just []
safeInit (x:xs) = case (safeInit xs) of
                    Nothing -> Nothing
                    Just a -> Just (x : a)




safeInit _ = Nothing

-- same as '(++)'
myAppend :: [a] -> [a] -> [a]
myAppend [] b = b
myAppend a [] = a
myAppend a b = myAppend (myInit a) ((myLast a) : b)

-- same as 'concat'
myConcat :: [[a]] -> [a]
myConcat (x:xs) = myAppend x $ myConcat xs
myConcat _ = []

-- same as 'reverse'
myReverse :: [a] -> [a]
myReverse [x] = [x]
myReverse (x:xs) = myAppend (myReverse xs) [x]
myReverse _ = []

-- same as 'and'
myAnd :: [Bool] -> Bool
myAnd [] = True
myAnd [x] = x
myAnd (x:xs) = x && myAnd xs

-- pointless...
myAnd' :: [Bool] -> Bool
myAnd' = foldl (&&) True

-- same as 'or'
myOr :: [Bool] -> Bool
myOr = foldl (||) False

-- same as 'all'
myAll :: (a -> Bool) -> [a] -> Bool
myAll pred = myAnd . map pred

-- same as 'any'
myAny :: (a -> Bool) -> [a] -> Bool
myAny pred = myOr . map pred

splitWith :: (a -> Bool) -> [a] -> [[a]]
splitWith _ [] = []
-- why doesn't this work?
splitWith pred lst = takeWhile pred lst : splitWith pred (dropWhile pred lst)

