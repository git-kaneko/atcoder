myFunc :: Int -> [Int] -> Bool
myFunc _ [] = True
myFunc a (x:xs)
  | a < x = myFunc x xs
  | otherwise = False

main :: IO ()
main = do
  input <- fmap (fmap(read :: String -> Int) . words) . take 2 . lines <$> getContents

  if myFunc 0 (input !! 1)
    then putStrLn "Yes"
    else putStrLn "No"
