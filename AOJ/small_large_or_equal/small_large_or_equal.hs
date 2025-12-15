-- comparison :: Int -> Int -> String
-- comparison x y = 
--   if x < y then "a < b"
--   else if x > y then "a > b"
--   else "a == b"

-- main :: IO ()

-- main = do
--   [i, j] <- map read . words <$> getLine :: IO [Int]

--   putStrLn $ comparison i j


main :: IO ()
main = do
  [i, j] <- map read . words <$> getLine :: IO [Int]
  putStrLn $ case compare i j of
    LT -> "a < b"
    GT -> "a > b"
    EQ -> "a == b"
