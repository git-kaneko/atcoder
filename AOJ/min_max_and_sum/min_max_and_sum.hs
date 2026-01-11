main :: IO ()
main = do
  _ <- fmap (read :: String -> Int) . words <$> getLine
  ns <- fmap (read :: String -> Int) . words <$> getLine
  putStrLn $ show (minimum ns) ++ " " ++ show (maximum ns) ++ " " ++ show (sum ns)
