qsort :: [Int] -> [Int]
qsort [] = []
qsort (x : xs) = qsort (filter (< x) xs) ++ [x] ++ qsort (filter (>= x) xs)

main :: IO ()
main = do
  x <- fmap (read :: String -> Int) . words <$> getLine

  putStrLn $ unwords $ map show $ qsort x
