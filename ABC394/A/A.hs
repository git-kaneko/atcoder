main :: IO ()

main = do
  n <- getLine
  let x = filter (=='2') n
  let y = read x :: Int
  print y
