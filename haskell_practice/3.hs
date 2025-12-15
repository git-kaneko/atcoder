multiply :: Int -> Int -> Int
multiply x y = x * y

myLength :: [a] -> Int
myLength = foldr (\x -> (+) 1) 0

triple :: Int -> Int
triple x = x * 3

square :: Int -> Int
square x = x ^ 2

isPositive :: Int -> Bool
isPositive x = x > 0

average :: Double -> Double -> Double
average x y = (x + y) / 2

head $ tail $ tail [1, 2, 3, 4, 5]
length $ reverse $ take 3 [1, 2, 3, 4, 5]
double $ double $ double 2
