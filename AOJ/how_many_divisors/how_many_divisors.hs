main :: IO ()
main = do
  [a, b, c] <- map read . words <$> getLine
  print $ length [x | x <- [a .. b], c `mod` x == 0]
