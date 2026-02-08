main :: IO ()
main = interact $ concatMap draw . takeWhile (/= (0, 0)) . map parseHW . lines
  where
    parseHW s = let [h, w] = map read (words s) in (h, w)
    draw (h, w) = unlines (top : replicate (h - 2) mid ++ [top, ""])
      where
        top = replicate w '#'
        mid = '#' : replicate (w - 2) '.' ++ "#"
