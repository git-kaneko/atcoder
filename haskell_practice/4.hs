sageHead :: [a] -> Maybe a
sageHead [] = Nothing
sageHead (x : xs) = Just x

safeDivide :: Double -> Double -> Either String Double
safeDivide _ 0 = Left "Division by zero"
safeDivide 0 _ = Left "Division by zero"
safeDivide x y = Right (x / y)

mySum :: [Int] -> Int
mySum [] = 0
mySum (x : xs) = x + mySum xs

myProduct :: [Int] -> Int
myProduct [] = 0
myProduct (x : xs) = x * myProduct xs

myReverse :: [a] -> [a]
myReverse [] = []
myReverse (x : xs) = myReverse xs ++ [x]

-- myTake :: Int -> [a] -> a
-- myTake n x:xs =

myElem :: a -> [a] -> Bool
myElem n x = n == x
myElem n (x : xs) = myElem n xs

sing :: Int -> Int
sing x
  | x > 0 = 1
  | x < 0 = -1
  | x == 0 = 0

gradeScore :: Int -> Char
gradeScore x
  | x > 90 = 'A'
  | x > 80 = 'B'
  | x > 70 = 'C'
  | otherwise = 'D'

fizzbuzz :: Int -> String
fizzbuzz x
  | x `mod` 15 == 0 = "FizzBuzz"
  | x `mod` 3 == 0 = "Fizz"
  | x `mod` 5 == 0 = "Buzz"
  | otherwise = show x
