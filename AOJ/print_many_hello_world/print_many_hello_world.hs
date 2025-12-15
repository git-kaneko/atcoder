main :: IO ()
main = do
  putStrLn $ ans 1000

ans :: Int -> String
ans 1 = "Hello World"
ans x = "Hello World\n" ++ ans (x - 1)
