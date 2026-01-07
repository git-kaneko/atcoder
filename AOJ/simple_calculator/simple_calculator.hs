loop :: Int -> IO ()
loop i = do
  (a, op, c) <- (\[x, y, z] -> (read x, head y, read z)) . words <$> getLine
  if op == '?'
    then return ()
    else do
      let result = case op of
            '+' -> a + c
            '-' -> a - c
            '*' -> a * c
            '/' -> a `div` c
      print result
      loop (i + 1)

main :: IO ()
main = loop 1
