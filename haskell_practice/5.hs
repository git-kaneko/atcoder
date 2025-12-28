myMap :: (a -> b) -> [a] -> [b]
myMap _ [] = []
myMap f (x : xs) = f x : myMap f xs

myFilter :: (a -> Bool) -> [a] -> [a]
myFilter _ [] = []
myFilter f (x : xs)
  | f x = x : myFilter f xs
  | otherwise = myFilter f xs

-- 5-3-a
map (* 2) [1, 2, 3, 4, 5]

-- 5-3-b
map (^ 2) [1, 2, 3, 4, 5]

-- 5-3-c
map length ["hello", "world"]

-- 5-3-d
map (\(x, y) -> x + y) [(1, 2), (3, 4), (5, 6)]

-- 5-4-a
filter even [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

-- 5-4-b
filter (x > 0) [1, -2, 3, -4, 5]

-- 5-4-c
filter (not . null) ["", "hello", "", "world", ""]

-- 5-6-a
mySum :: (Num a) => [a] -> a
mySum x = foldr (+) 0

-- 5-6-b
myLength :: [a] -> Int
myLength = foldr ()

-- 5-6-c
myMap :: (a -> b) -> [a] -> [b]
myMap f = foldr (\x acc -> f x : acc) []

-- 5-6-d
myFilter :: (a -> Bool) -> [a] -> [a]
myFilter p = foldr (\x acc -> if p x then x : acc else acc) []
