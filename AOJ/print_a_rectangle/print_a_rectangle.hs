main :: IO ()
main = interact $ concatMap draw . takeWhile (/= [0, 0]) . map (map read . words) . lines
  where
    draw [h, w] = unlines (replicate h (replicate w '#')) ++ "\n"
