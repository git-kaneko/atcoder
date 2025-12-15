main :: IO ()

main = do
  input <- getLine

  putStrLn $ (: "") $ head $ filter (flip notElem input) ['a'..'z']  
