main :: IO ()
main = interact $ concatMap draw . takeWhile (/= [0, 0]) . map (map read . words) . lines
  where
    draw [h, w] = replicate w '#' ++ "\n" ++ unlines (replicate (h - 2) ("#" ++ replicate (w - 2) '.' ++ "#")) ++ replicate w '#' ++ "\n\n"
