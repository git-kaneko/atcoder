main = interact $ unlines . map (show . cal) . takeWhile ((/= "?") . (!! 1)) . map words . lines

cal :: (Read a, Integral a) => [String] -> a
cal [a, "+", b] = read a + read b
cal [a, "-", b] = read a - read b
cal [a, "*", b] = read a * read b
cal [a, "/", b] = read a `div` read b
