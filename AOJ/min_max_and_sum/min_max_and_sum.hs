main :: IO ()
main = do
  _ <- getLine
  ns <- map read . words <$> getLine :: IO [Int]
  putStrLn $ unwords $ map show [minimum ns, maximum ns, sum ns]
