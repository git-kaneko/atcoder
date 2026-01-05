import Numeric (showFFloat)

main :: IO ()
main = do
  [a, b] <- map read . words <$> getLine :: IO [Int]
  let d = fromIntegral a `quot` fromIntegral b
  let m = a `mod` b
  let q = fromIntegral a / fromIntegral b

  putStrLn $ show d ++ " " ++ show m ++ " " ++ showFFloat Nothing q ""
