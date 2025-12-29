-- 6-1-a
addOne = map (+ 1)

-- 6-1-b
dobuleAll = map (* 2)

-- 6-1-c
removeEmpty = filter (not . null)

-- 6-1-d
sumList = foldr (+) 0

-- 6-2-a
stringLengths :: [String] -> [Int]
stringLengths = map length

-- 6-2-b
lastThree :: [a] -> [a]
lastThree = take 3 . reverse

-- 6-2-c
sumEvens :: [Int] -> Int
sumEvens = sum . filter even

-- 6-2-d
doubleLength :: String -> Int
doubleLength = (* 2) . length
