loop :: Int -> IO ()
loop i = do
  n <- readLn :: IO Int
  if n == 0
    then return ()
    else do
      putStrLn $ "Case " ++ show i ++ ": " ++ show n
      loop (i + 1)

main :: IO ()
main = loop 1
