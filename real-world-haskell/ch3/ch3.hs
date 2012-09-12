import Data.List
import Prelude hiding (Right, Left)

data BookInfo = Book Int String [String]
                deriving (Show)

bookID (Book id title authors)  = id
bookTitle (Book id title authors) = title
bookAuthors (Book id title authors) = authors

data MagazineInfo = Magazine Int String [String]
                    deriving (Show)

myBook = Book 3402834 "Algebra of Programming"
         ["Adam Midvidy", "George Washington"]

type CustomerID = Int
type ReviewBody = String

data BookReview = BookReview BookInfo CustomerID String
data BetterReview = BetterReview BookInfo CustomerID ReviewBody

type BookRecord = (BookInfo, BookReview)

type CardHolder = String
type CardNumber = String
type Address = [String]

data BillingInfo = CreditCard CardNumber CardHolder Address
                 | CashOnDelivery
                 | Invoice CustomerID
                   deriving (Show)

data Roygbiv = Red
             | Orange
             | Yellow
             | Green
             | Blue
             | Indigo
             | Violet
               deriving (Eq, Show)

myNot True = False
myNot False = True

sumList (x:xs) = x + sumList xs
sumList []     = 0

third (a, b, c) = c

data Customer = Customer {
     customerID :: CustomerID,
     customerName :: String,
     customerAddress :: Address
} deriving (Show)

data List a = Cons a (List a)
          | Nil
            deriving (Show)

fromList :: [a] -> List a
fromList (x:xs) = Cons x (fromList xs)
fromList []     = Nil

toList :: List a -> [a]
toList (Cons x xs) = x : toList xs
toList Nil         = []

data MTree a = MNode a (Maybe (MTree a)) (Maybe (MTree a))

safeSecond :: [a] -> Maybe a
safeSecond [] = Nothing
safeSecond xs = if null (tail xs)
                then Nothing
                else Just (head (tail xs))

tidySecond :: [a] -> Maybe a
tidySecond (_:x:_) = Just x
tidySecond _       = Nothing

lend amount balance = let reserve = 100
                          newBalance = balance - amount
                      in if balance < reserve
                         then Nothing
                         else Just newBalance

pluralise :: String -> [Int] -> [String]
pluralise word counts = map plural counts
          where plural 0 = "no " ++ word  ++ "s"
                plural 1 = "one " ++ word
                plural n = show n ++ " " ++ word ++ "s"


tidySecond' x = case x of
                    (_:a:_) -> Just a
                    _       -> Nothing

myLength :: [a] -> Integer
myLength (x:xs) = 1 + myLength xs
myLength [] = 0

myMean :: [Integer] -> Double
myMean x = (fromIntegral (sum x)) / (fromIntegral (length x))

makePalindrome lst = lst ++ (reverse lst)
               where reverse (x:[])  = [x]
                     reverse (x:xs)  = (reverse xs) ++ [x]
                     reverse []      = []

isPalindrome :: Eq a => [a] -> Bool
isPalindrome [] = True
isPalindrome (_:[]) = True
isPalindrome (x:xs) = (x == (last xs)) && (isPalindrome (init xs))



sortByLength = sortBy (\ x y -> compare (length x) (length y))

intersperse' :: Char -> [String] -> String
intersperse' _ [] = []
intersperse' _ (x:[]) = x
intersperse' sep (x:xs) = (x ++ [sep]) ++ (intersperse' sep xs)

data Tree a = Node a (Tree a) (Tree a)
            | Empty
              deriving (Show)

height :: Tree a -> Integer
height Empty = 0
height (Node a left right) = max (1 + (height left)) (1 + (height right))

data Direction = Straight | Left | Right
                 deriving (Eq, Show)

type Vector = (Double, Double)

getDirection :: Vector -> Vector -> Vector -> Direction
getDirection (x1, y1) (x2, y2) (x3, y3)
             | crossprod > 0 = Left
             | crossprod < 0 = Right
             | otherwise     = Straight
             where crossprod = (x2 - x1) * (y3 - y1) - (y2 - y1) * (x3 - x1)

getDirections :: [Vector] -> [Direction]
getDirections (x:y:z:xs) = getDirection x y z : getDirections (y:z:xs)
getDirections _ = []

sortByY = sortBy (\ x y -> compare (snd x) (snd y))


-- convexHull :: [Vector] -> [Vector]
-- will come back to this later