add a b = a + b

myDrop :: Int -> [a] -> [a]
myDrop n xs = if n <= 0 || null xs
       then xs
       else myDrop (n - 1) (tail xs)

isOdd n = mod n 2 == 1

lastButOne :: [a] -> a
lastButOne x = last $ take ((length x) - 1) x

lastButOne' :: [a] -> a
lastButOne' (x:y:[]) = x
lastButOne' (x:xs) = lastButOne' xs
lastButOne' _ = error "you can't do that"