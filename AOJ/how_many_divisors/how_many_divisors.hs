main :: IO ()
main = do
  [a, b, c] <- map read . words <$> getLine :: IO [Int]

  let ans = divisors c [a .. b]

  print ans

divisors :: Int -> [Int] -> Int
divisors _ [] = 0
divisors y (x : xs) = (if y `mod` x == 0 then 1 else 0) + divisors y xs
