loop :: Int -> IO ()
loop i = do
  [a, b] <- map read . words <$> getLine :: IO [Int]
  if a == 0 && b == 0
    then return ()
    else do
      putStrLn $ case compare a b of
        LT -> unwords [show a, show b]
        EQ -> unwords [show a, show b]
        GT -> unwords [show b, show a]
      loop (i + 1)

main :: IO ()
main = loop 1
