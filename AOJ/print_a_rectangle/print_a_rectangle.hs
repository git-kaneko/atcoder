main :: IO ()
main = do
  interact $ concatMap (\[h, w] -> output w h) . takeWhile (/= [0, 0]) . map (map read . words) . lines

output :: Int -> Int -> String
output _ 0 = "\n"
output w h = replicate w '#' ++ "\n" ++ output w (h - 1)
