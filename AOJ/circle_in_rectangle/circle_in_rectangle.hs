main :: IO ()
main = do
  [w, h, x, y, r] <- map read . words <$> getLine :: IO [Int]

  putStrLn $
    if x - r >= 0 && y - r >= 0 && x + r <= w && y + r <= h
      then "Yes"
      else "No"
