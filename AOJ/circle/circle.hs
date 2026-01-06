import Text.Printf (printf)

main :: IO ()
main = do
  [n] <- fmap (read :: String -> Double) . words <$> getLine

  let p = n * n * pi
      l = n * 2.0 * pi

  printf "%f %f\n" p l
