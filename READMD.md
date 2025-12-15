# Haskellで競技プログラミング

## コンパイル
stack ghc [対象ファイル]


## 入力

1行
n <- fmap (read :: String -> Int) . words <$> getLine

複数行
ns <- fmap (fmap(read :: String -> Int) . words) . lines <$> getContents
