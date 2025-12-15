# Haskell練習問題集

## 〜手を動かして学ぶ関数型プログラミング〜

---

## この問題集の使い方

1. 各章の**最小限の解説**を読む
2. **練習問題**を解く（GHCiで試しながら）
3. **解答例**で確認（複数の解法を掲載）
4. 理解できたら次の章へ

**推奨環境：** GHCi（対話環境）を起動して、実際にコードを打ち込みながら進めてください。

```bash
$ ghci
Prelude> 
```

**ファイルの読み込み：**

```bash
$ ghci myfile.hs
-- または
Prelude> :load myfile.hs
Prelude> :reload  -- 変更後の再読み込み
```

---

# 第1章：基本の式と型

## 解説

```haskell
-- 算術演算
2 + 3      -- 5
10 - 4     -- 6
3 * 5      -- 15
7 `div` 2  -- 3（整数除算）
7 `mod` 2  -- 1（剰余）

-- 比較演算
3 == 3     -- True
3 /= 4     -- True（等しくない）
5 > 3      -- True

-- 論理演算
True && False  -- False
True || False  -- True
not True       -- False

-- 型を調べる（GHCiで）
:t 42          -- 42 :: Num a => a
:t "hello"     -- "hello" :: String
:t True        -- True :: Bool
```

---

## 練習問題

### 問題1-1：計算

GHCiで以下の式を評価し、結果を予想してから確認せよ。

```haskell
a) 3 + 4 * 2
b) (3 + 4) * 2
c) 10 `div` 3
d) 10 `mod` 3
e) 2 ^ 10
```

### 問題1-2：比較と論理

以下の式の結果（TrueまたはFalse）を予想せよ。

```haskell
a) 5 > 3 && 2 > 4
b) 5 > 3 || 2 > 4
c) not (5 == 5)
d) 3 /= 3
e) (10 `mod` 2) == 0
```

### 問題1-3：型の推測

以下の値の型を予想し、`:t` で確認せよ。

```haskell
a) 'a'
b) "hello"
c) [1, 2, 3]
d) (True, 42)
e) head
```

---

## 解答

<details>
<summary>問題1-1の解答</summary>

```haskell
a) 11      -- *が優先
b) 14
c) 3       -- 切り捨て
d) 1
e) 1024
```

</details>

<details>
<summary>問題1-2の解答</summary>

```haskell
a) False   -- True && False
b) True    -- True || False
c) False   -- not True
d) False   -- 3は3と等しい
e) True    -- 10は偶数
```

</details>

<details>
<summary>問題1-3の解答</summary>

```haskell
a) 'a' :: Char
b) "hello" :: String  -- [Char]と同じ
c) [1, 2, 3] :: Num a => [a]
d) (True, 42) :: Num b => (Bool, b)
e) head :: [a] -> a
```

</details>

---

# 第2章：リスト

## 解説

```haskell
-- リストの作成
[1, 2, 3]           -- リストリテラル
1 : 2 : 3 : []      -- cons構成子（同じ意味）
[1..5]              -- [1,2,3,4,5]
[1,3..10]           -- [1,3,5,7,9]

-- 基本操作
head [1,2,3]        -- 1
tail [1,2,3]        -- [2,3]
last [1,2,3]        -- 3
init [1,2,3]        -- [1,2]
length [1,2,3]      -- 3
null []             -- True
reverse [1,2,3]     -- [3,2,1]

-- 結合とアクセス
[1,2] ++ [3,4]      -- [1,2,3,4]
[1,2,3] !! 1        -- 2（0始まり）
take 2 [1,2,3,4]    -- [1,2]
drop 2 [1,2,3,4]    -- [3,4]
```

---

## 練習問題

### 問題2-1：リスト操作

以下の式の結果を予想せよ。

```haskell
a) head [5,4,3,2,1]
b) tail [5,4,3,2,1]
c) [1,2,3] ++ [4,5]
d) length "hello"
e) reverse "hello"
f) take 3 [1,2,3,4,5]
g) drop 3 [1,2,3,4,5]
h) [1,2,3] !! 2
```

### 問題2-2：数列表記

以下の数列表記が生成するリストを答えよ。

```haskell
a) [1..5]
b) [2,4..10]
c) [10,9..1]
d) ['a'..'e']
e) take 5 [1,3..]
```

### 問題2-3：リストの構築

以下のリストを、cons構成子（`:`と`[]`）を使って表現せよ。

```haskell
a) [1, 2, 3]
b) "ab"   -- ヒント: "ab" == ['a', 'b']
c) [[1], [2, 3]]
```

### 問題2-4：エラーになる式

以下の式のうち、エラーになるものはどれか？理由も答えよ。

```haskell
a) head []
b) [1, 2] ++ [3, 4]
c) [1, 2] ++ ["three"]
d) [1, "two", 3]
e) [[1, 2], [3]]
```

---

## 解答

<details>
<summary>問題2-1の解答</summary>

```haskell
a) 5
b) [4,3,2,1]
c) [1,2,3,4,5]
d) 5
e) "olleh"
f) [1,2,3]
g) [4,5]
h) 3
```

</details>

<details>
<summary>問題2-2の解答</summary>

```haskell
a) [1,2,3,4,5]
b) [2,4,6,8,10]
c) [10,9,8,7,6,5,4,3,2,1]
d) "abcde"
e) [1,3,5,7,9]
```

</details>

<details>
<summary>問題2-3の解答</summary>

```haskell
a) 1 : 2 : 3 : []
b) 'a' : 'b' : []
c) [1] : [2, 3] : []
   -- または (1:[]) : (2:3:[]) : []
```

</details>

<details>
<summary>問題2-4の解答</summary>

```haskell
a) エラー: 空リストにheadは使えない
b) OK: [1,2,3,4]
c) エラー: Int と String を混在できない
d) エラー: 同上
e) OK: [[1,2],[3]]（リストのリストはOK）
```

</details>

---

# 第3章：関数定義の基本

## 解説

```haskell
-- 基本的な関数定義
double x = x * 2
add x y = x + y

-- 型注釈（型シグネチャ）
double :: Int -> Int
double x = x * 2

add :: Int -> Int -> Int
add x y = x + y

-- 関数適用
double 5       -- 10
add 2 3        -- 5
add (double 2) 3  -- 7
```

---

## 練習問題

### 問題3-1：掛け算関数

2つの整数を受け取り、その積を返す関数`multiply`を定義せよ。
型シグネチャも書くこと。

```haskell
multiply :: Int -> Int -> Int
multiply = ?
```

### 問題3-2：リストの長さ

リストの長さを計算する関数`myLength`を**再帰**を使って実装せよ。

```haskell
myLength :: [a] -> Int
myLength = ?
```

### 問題3-3：基本的な関数

以下の関数を定義せよ。

```haskell
a) triple x : xを3倍する
b) square x : xの2乗を返す
c) isPositive x : xが正ならTrue
d) average x y : xとyの平均を返す（結果はDouble）
```

### 問題3-4：$演算子

以下の式を`$`演算子を使って書き換えよ。

```haskell
a) head (tail (tail [1,2,3,4,5]))
b) length (reverse (take 3 [1,2,3,4,5]))
c) double (double (double 2))
```

---

## 解答

<details>
<summary>問題3-1の解答（複数の書き方）</summary>

```haskell
-- 基本版
multiply :: Int -> Int -> Int
multiply x y = x * y

-- パターンマッチング版1: 0との掛け算を特別扱い
multiplyPM1 :: Int -> Int -> Int
multiplyPM1 0 _ = 0
multiplyPM1 _ 0 = 0
multiplyPM1 x y = x * y

-- パターンマッチング版2: 1との掛け算も特別扱い
multiplyPM2 :: Int -> Int -> Int
multiplyPM2 1 y = y
multiplyPM2 x 1 = x
multiplyPM2 0 _ = 0
multiplyPM2 _ 0 = 0
multiplyPM2 x y = x * y

-- 再帰版: 足し算で掛け算を実現
multiplyRec :: Int -> Int -> Int
multiplyRec _ 0 = 0
multiplyRec x 1 = x
multiplyRec x y
    | y > 0     = x + multiplyRec x (y - 1)
    | otherwise = -(multiplyRec x (-y))
```

</details>

<details>
<summary>問題3-2の解答</summary>

```haskell
myLength :: [a] -> Int
myLength []     = 0
myLength (_:xs) = 1 + myLength xs

-- 展開イメージ
-- myLength [1,2,3]
-- = 1 + myLength [2,3]
-- = 1 + 1 + myLength [3]
-- = 1 + 1 + 1 + myLength []
-- = 1 + 1 + 1 + 0
-- = 3
```

</details>

<details>
<summary>問題3-3の解答</summary>

```haskell
triple :: Int -> Int
triple x = x * 3

square :: Int -> Int  
square x = x * x

isPositive :: Int -> Bool
isPositive x = x > 0

average :: Double -> Double -> Double
average x y = (x + y) / 2
```

</details>

<details>
<summary>問題3-4の解答</summary>

```haskell
a) head $ tail $ tail [1,2,3,4,5]
b) length $ reverse $ take 3 [1,2,3,4,5]
c) double $ double $ double 2
```

</details>

---

# 第4章：パターンマッチングと再帰

## 解説

```haskell
-- パターンマッチング
factorial :: Int -> Int
factorial 0 = 1
factorial n = n * factorial (n - 1)

-- リストのパターンマッチ
-- []    : 空リスト
-- (x:xs): 先頭要素xと残りのリストxs
mySum :: [Int] -> Int
mySum []     = 0
mySum (x:xs) = x + mySum xs

-- ガード
absolute :: Int -> Int
absolute n
    | n < 0     = -n
    | otherwise = n
```

---

## 練習問題

### 問題4-1：安全なhead関数

`Maybe`型を使って、リストの最初の要素を**安全に**取得する関数を書け。
空リストの場合は`Nothing`を返すこと。

```haskell
safeHead :: [a] -> Maybe a
safeHead = ?
```

### 問題4-2：安全な除算

`Either`型を使って、0での除算を防ぐ安全な除算関数を作れ。
0で割ろうとした場合はエラーメッセージを返すこと。

```haskell
safeDivide :: Double -> Double -> Either String Double
safeDivide = ?

-- 使用例
-- safeDivide 10 2  → Right 5.0
-- safeDivide 10 0  → Left "Division by zero"
```

### 問題4-3：再帰関数の定義

以下の関数を再帰で定義せよ。

```haskell
a) mySum xs : リストの全要素の和
b) myProduct xs : リストの全要素の積
c) myReverse xs : リストを逆順に
d) myTake n xs : リストの先頭n要素を取る
e) myElem x xs : xがリストに含まれるか
```

### 問題4-4：ガードを使った関数

以下の関数をガードを使って定義せよ。

```haskell
a) sign x : 正なら1、負なら-1、ゼロなら0を返す
b) grade score : 90以上"A", 80以上"B", 70以上"C", それ以外"D"
c) fizzbuzz n : 15で割り切れたら"FizzBuzz", 3なら"Fizz", 5なら"Buzz", それ以外は数字
```

---

## 解答

<details>
<summary>問題4-1の解答</summary>

```haskell
safeHead :: [a] -> Maybe a
safeHead []    = Nothing
safeHead (x:_) = Just x

-- 使用例
-- safeHead []      → Nothing
-- safeHead [1,2,3] → Just 1
```

</details>

<details>
<summary>問題4-2の解答</summary>

```haskell
safeDivide :: Double -> Double -> Either String Double
safeDivide _ 0 = Left "Division by zero"
safeDivide x y = Right (x / y)

-- 使用例
-- safeDivide 10 2  → Right 5.0
-- safeDivide 10 0  → Left "Division by zero"
```

</details>

<details>
<summary>問題4-3の解答</summary>

```haskell
mySum :: Num a => [a] -> a
mySum []     = 0
mySum (x:xs) = x + mySum xs

myProduct :: Num a => [a] -> a
myProduct []     = 1
myProduct (x:xs) = x * myProduct xs

myReverse :: [a] -> [a]
myReverse []     = []
myReverse (x:xs) = myReverse xs ++ [x]

myTake :: Int -> [a] -> [a]
myTake 0 _      = []
myTake _ []     = []
myTake n (x:xs) = x : myTake (n-1) xs

myElem :: Eq a => a -> [a] -> Bool
myElem _ []     = False
myElem e (x:xs) = e == x || myElem e xs
```

</details>

<details>
<summary>問題4-4の解答</summary>

```haskell
sign :: Int -> Int
sign x
    | x > 0     = 1
    | x < 0     = -1
    | otherwise = 0

grade :: Int -> String
grade score
    | score >= 90 = "A"
    | score >= 80 = "B"
    | score >= 70 = "C"
    | otherwise   = "D"

fizzbuzz :: Int -> String
fizzbuzz n
    | n `mod` 15 == 0 = "FizzBuzz"
    | n `mod` 3  == 0 = "Fizz"
    | n `mod` 5  == 0 = "Buzz"
    | otherwise       = show n
```

</details>

---

# 第5章：高階関数

## 解説

```haskell
-- map: 各要素に関数を適用
map (*2) [1,2,3]        -- [2,4,6]
map head ["ab","cd"]    -- "ac"

-- filter: 条件を満たす要素を抽出
filter even [1,2,3,4]   -- [2,4]
filter (>3) [1,2,3,4,5] -- [4,5]

-- foldr: 右から畳み込む
foldr (+) 0 [1,2,3]     -- 6
foldr (:) [] [1,2,3]    -- [1,2,3]

-- ラムダ式
map (\x -> x * x) [1,2,3]  -- [1,4,9]
```

---

## 練習問題

### 問題5-1：map関数の再実装

`map`関数を再帰で実装せよ。

```haskell
myMap :: (a -> b) -> [a] -> [b]
myMap = ?
```

### 問題5-2：filter関数の再実装

`filter`関数を再帰で実装せよ。

```haskell
myFilter :: (a -> Bool) -> [a] -> [a]
myFilter = ?
```

### 問題5-3：mapの活用

`map`を使って以下を実現せよ。

```haskell
a) [1,2,3,4,5] から [2,4,6,8,10] を作る
b) [1,2,3,4,5] から [1,4,9,16,25] を作る
c) ["hello","world"] から [5,5] を作る
d) [(1,2),(3,4),(5,6)] から [3,7,11] を作る（各タプルの和）
```

### 問題5-4：filterの活用

`filter`を使って以下を実現せよ。

```haskell
a) [1,2,3,4,5,6,7,8,9,10] から偶数だけを取り出す
b) [1,-2,3,-4,5] から正の数だけを取り出す
c) ["","hello","","world",""] から空でない文字列だけを取り出す
```

### 問題5-5：foldrの理解

以下の式を手で展開し、結果を求めよ。

```haskell
a) foldr (+) 0 [1,2,3]
b) foldr (*) 1 [2,3,4]
c) foldr (:) [] [1,2,3]
d) foldr (++) "" ["a","b","c"]
```

### 問題5-6：foldrで関数を再実装

`foldr`を使って以下の関数を定義せよ。

```haskell
a) mySum : リストの総和
b) myLength : リストの長さ
c) myMap : map関数
d) myFilter : filter関数
```

---

## 解答

<details>
<summary>問題5-1の解答</summary>

```haskell
myMap :: (a -> b) -> [a] -> [b]
myMap _ []     = []
myMap f (x:xs) = f x : myMap f xs

-- 使用例
-- myMap (*2) [1,2,3]  → [2,4,6]
-- myMap show [1,2,3]  → ["1","2","3"]
```

</details>

<details>
<summary>問題5-2の解答</summary>

```haskell
myFilter :: (a -> Bool) -> [a] -> [a]
myFilter _ []     = []
myFilter p (x:xs)
    | p x       = x : myFilter p xs
    | otherwise = myFilter p xs

-- 使用例
-- myFilter even [1,2,3,4]  → [2,4]
-- myFilter (>0) [-1,2,-3,4] → [2,4]
```

</details>

<details>
<summary>問題5-3の解答</summary>

```haskell
a) map (*2) [1,2,3,4,5]
b) map (^2) [1,2,3,4,5]
   -- または map (\x -> x * x) [1,2,3,4,5]
c) map length ["hello","world"]
d) map (\(x,y) -> x + y) [(1,2),(3,4),(5,6)]
   -- または map (uncurry (+)) [(1,2),(3,4),(5,6)]
```

</details>

<details>
<summary>問題5-4の解答</summary>

```haskell
a) filter even [1,2,3,4,5,6,7,8,9,10]
b) filter (>0) [1,-2,3,-4,5]
c) filter (not . null) ["","hello","","world",""]
   -- または filter (/="") ["","hello","","world",""]
```

</details>

<details>
<summary>問題5-5の解答</summary>

```haskell
a) foldr (+) 0 [1,2,3]
   = 1 + (2 + (3 + 0))
   = 6

b) foldr (*) 1 [2,3,4]
   = 2 * (3 * (4 * 1))
   = 24

c) foldr (:) [] [1,2,3]
   = 1 : (2 : (3 : []))
   = [1,2,3]

d) foldr (++) "" ["a","b","c"]
   = "a" ++ ("b" ++ ("c" ++ ""))
   = "abc"
```

</details>

<details>
<summary>問題5-6の解答</summary>

```haskell
mySum :: Num a => [a] -> a
mySum = foldr (+) 0

myLength :: [a] -> Int
myLength = foldr (\_ acc -> acc + 1) 0

myMap :: (a -> b) -> [a] -> [b]
myMap f = foldr (\x acc -> f x : acc) []

myFilter :: (a -> Bool) -> [a] -> [a]
myFilter p = foldr (\x acc -> if p x then x : acc else acc) []
```

</details>

---

# 第6章：関数合成とポイントフリー

## 解説

```haskell
-- 関数合成 (.)
(f . g) x = f (g x)

-- 例
doubleAndAddOne = (+1) . (*2)
doubleAndAddOne 5  -- 11

-- ポイントフリースタイル
-- 引数を明示せずに関数を定義するスタイル

-- 通常
addOne xs = map (+1) xs

-- ポイントフリー
addOne' = map (+1)
```

---

## 練習問題

### 問題6-1：ポイントフリーへの書き換え

以下の関数をポイントフリースタイルで書き直せ。

```haskell
a) addOne xs = map (+1) xs
b) doubleAll xs = map (*2) xs
c) removeEmpty xs = filter (not . null) xs
d) sumList xs = foldr (+) 0 xs
```

### 問題6-2：関数合成の活用

以下を関数合成（`.`）を使って1つの関数として定義せよ。

```haskell
a) 文字列のリストを受け取り、各文字列の長さのリストを返す
   stringLengths :: [String] -> [Int]

b) リストを逆順にして先頭3要素を取る
   lastThree :: [a] -> [a]

c) リストの偶数だけを取り出して総和を求める
   sumEvens :: [Int] -> Int

d) 文字列の長さを2倍にした値を返す
   doubleLength :: String -> Int
```

### 問題6-3：合成の読み取り

以下の関数の動作を説明せよ。

```haskell
a) take 5 . filter even $ [1..]
b) length . filter (>0) $ [-3,-1,0,2,4]
c) map (*2) . filter odd $ [1..10]
d) sum . map (^2) $ [1..5]
```

---

## 解答

<details>
<summary>問題6-1の解答</summary>

```haskell
a) addOne = map (+1)
b) doubleAll = map (*2)
c) removeEmpty = filter (not . null)
d) sumList = foldr (+) 0
```

</details>

<details>
<summary>問題6-2の解答</summary>

```haskell
a) stringLengths :: [String] -> [Int]
   stringLengths = map length

b) lastThree :: [a] -> [a]
   lastThree = take 3 . reverse

c) sumEvens :: [Int] -> Int
   sumEvens = sum . filter even

d) doubleLength :: String -> Int
   doubleLength = (*2) . length
```

</details>

<details>
<summary>問題6-3の解答</summary>

```haskell
a) take 5 . filter even $ [1..]
   -- 無限リストから偶数だけを取り出し、先頭5個を返す
   -- → [2,4,6,8,10]

b) length . filter (>0) $ [-3,-1,0,2,4]
   -- 正の数だけをフィルタし、その個数を返す
   -- → 2 （2と4の2個）

c) map (*2) . filter odd $ [1..10]
   -- 奇数だけをフィルタし、それぞれを2倍
   -- → [2,6,10,14,18]

d) sum . map (^2) $ [1..5]
   -- 各要素を2乗してから合計
   -- → 55 （1+4+9+16+25）
```

</details>

---

# 第7章：代数的データ型

## 解説

```haskell
-- 列挙型
data Color = Red | Green | Blue deriving (Show, Eq)

-- 値を持つ型
data Shape = Circle Double | Rectangle Double Double deriving Show

area :: Shape -> Double
area (Circle r)      = pi * r * r
area (Rectangle w h) = w * h

-- 再帰的データ型（木構造）
data Tree a = Leaf | Node a (Tree a) (Tree a) deriving Show
```

---

## 練習問題

### 問題7-1：木構造の定義

木構造を表現するデータ型`Tree`を定義し、木の深さを計算する関数を作れ。

```haskell
data Tree a = ?

depth :: Tree a -> Int
depth = ?

-- テストデータ
testTree :: Tree Int
testTree = Node 1 (Node 2 Leaf Leaf) (Node 3 Leaf (Node 4 Leaf Leaf))
--        1
--       / \
--      2   3
--         / \
--        _   4
-- 深さは3
```

### 問題7-2：木のリスト化

上記の木構造で、すべての値をリストにして返す関数を作れ（中順走査）。

```haskell
treeToList :: Tree a -> [a]
treeToList = ?

-- treeToList testTree → [2,1,3,4]
```

### 問題7-3：Showインスタンス

以下のデータ型にカスタムの`Show`インスタンスを定義せよ。

```haskell
data Color = Red | Green | Blue

-- show Red   → "赤"
-- show Green → "緑" 
-- show Blue  → "青"
```

### 問題7-4：Eqインスタンス

2次元の点を表す型を定義し、`Eq`のインスタンスにせよ。

```haskell
data Point = Point Double Double

instance Eq Point where
    (==) = ?

-- Point 1.0 2.0 == Point 1.0 2.0 → True
-- Point 1.0 2.0 == Point 1.0 3.0 → False
```

### 問題7-5：Maybe型の活用

以下の関数を実装せよ。

```haskell
-- リストのn番目の要素を安全に取り出す
safeIndex :: [a] -> Int -> Maybe a

-- 2つのMaybe値を足し算（どちらかがNothingならNothing）
addMaybe :: Maybe Int -> Maybe Int -> Maybe Int
```

---

## 解答

<details>
<summary>問題7-1の解答</summary>

```haskell
data Tree a = Leaf | Node a (Tree a) (Tree a) deriving Show

depth :: Tree a -> Int
depth Leaf         = 0
depth (Node _ l r) = 1 + max (depth l) (depth r)

testTree :: Tree Int
testTree = Node 1 (Node 2 Leaf Leaf) (Node 3 Leaf (Node 4 Leaf Leaf))

-- depth testTree → 3
```

</details>

<details>
<summary>問題7-2の解答</summary>

```haskell
-- 中順走査（左→根→右）
treeToList :: Tree a -> [a]
treeToList Leaf         = []
treeToList (Node x l r) = treeToList l ++ [x] ++ treeToList r

-- 先行順走査（根→左→右）
treeToListPre :: Tree a -> [a]
treeToListPre Leaf         = []
treeToListPre (Node x l r) = [x] ++ treeToListPre l ++ treeToListPre r

-- 後行順走査（左→右→根）
treeToListPost :: Tree a -> [a]
treeToListPost Leaf         = []
treeToListPost (Node x l r) = treeToListPost l ++ treeToListPost r ++ [x]
```

</details>

<details>
<summary>問題7-3の解答</summary>

```haskell
data Color = Red | Green | Blue

instance Show Color where
    show Red   = "赤"
    show Green = "緑"
    show Blue  = "青"
```

</details>

<details>
<summary>問題7-4の解答</summary>

```haskell
data Point = Point Double Double

instance Eq Point where
    (Point x1 y1) == (Point x2 y2) = x1 == x2 && y1 == y2
```

</details>

<details>
<summary>問題7-5の解答</summary>

```haskell
safeIndex :: [a] -> Int -> Maybe a
safeIndex [] _     = Nothing
safeIndex (x:_) 0  = Just x
safeIndex (_:xs) n
    | n < 0     = Nothing
    | otherwise = safeIndex xs (n - 1)

addMaybe :: Maybe Int -> Maybe Int -> Maybe Int
addMaybe Nothing _         = Nothing
addMaybe _ Nothing         = Nothing
addMaybe (Just x) (Just y) = Just (x + y)

-- または
addMaybe' :: Maybe Int -> Maybe Int -> Maybe Int
addMaybe' mx my = do
    x <- mx
    y <- my
    return (x + y)
```

</details>

---

# 第8章：リスト内包表記

## 解説

```haskell
-- 基本形
[x * 2 | x <- [1..5]]           -- [2,4,6,8,10]

-- 条件付き（ガード）
[x | x <- [1..10], even x]      -- [2,4,6,8,10]

-- 複数のジェネレータ
[(x,y) | x <- [1,2], y <- [3,4]]  -- [(1,3),(1,4),(2,3),(2,4)]
```

---

## 練習問題

### 問題8-1：基本的な内包表記

リスト内包表記で以下を実現せよ。

```haskell
a) 1から10までの3乗のリスト
b) 1から20までの偶数のリスト
c) 1から50までの7の倍数のリスト
d) [1,2,3,4,5]の各要素を2倍して1を引いたリスト
```

### 問題8-2：複数ジェネレータ

リスト内包表記で以下を実現せよ。

```haskell
a) 九九の表: [(1,1,1),(1,2,2),...,(9,9,81)]の形式
b) 1から10までの数から2つ選ぶ組み合わせ（x < yとなるペア）
c) [1,2,3]と[4,5,6]の全ペアの和のリスト
```

### 問題8-3：mapとfilterの書き換え

以下をリスト内包表記で書き換えよ。

```haskell
a) map (*2) [1,2,3,4,5]
b) filter even [1,2,3,4,5,6]
c) map (*2) (filter even [1,2,3,4,5,6])
```

### 問題8-4：ピタゴラス数

ピタゴラス数（a² + b² = c²を満たす(a,b,c)）で、各値が1から25の範囲のものを全て求めよ。
重複を避けるため a <= b <= c の条件を加えること。

```haskell
pythagorean :: [(Int, Int, Int)]
pythagorean = ?
```

---

## 解答

<details>
<summary>問題8-1の解答</summary>

```haskell
a) [x^3 | x <- [1..10]]
b) [x | x <- [1..20], even x]
c) [x | x <- [1..50], x `mod` 7 == 0]
d) [x * 2 - 1 | x <- [1,2,3,4,5]]
```

</details>

<details>
<summary>問題8-2の解答</summary>

```haskell
a) [(x, y, x*y) | x <- [1..9], y <- [1..9]]
b) [(x, y) | x <- [1..10], y <- [1..10], x < y]
c) [x + y | x <- [1,2,3], y <- [4,5,6]]
```

</details>

<details>
<summary>問題8-3の解答</summary>

```haskell
a) [x * 2 | x <- [1,2,3,4,5]]
b) [x | x <- [1,2,3,4,5,6], even x]
c) [x * 2 | x <- [1,2,3,4,5,6], even x]
```

</details>

<details>
<summary>問題8-4の解答</summary>

```haskell
pythagorean :: [(Int, Int, Int)]
pythagorean = [(a,b,c) | c <- [1..25], 
                         b <- [1..c], 
                         a <- [1..b], 
                         a^2 + b^2 == c^2]

-- 結果: [(3,4,5),(6,8,10),(5,12,13),(9,12,15),(8,15,17),(12,16,20),(15,20,25)]
```

</details>

---

# 第9章：モナド入門

## 解説

```haskell
-- Maybeモナド
-- 失敗しうる計算を連鎖できる

-- >>=（バインド）演算子
Just 5 >>= \x -> Just (x * 2)   -- Just 10
Nothing >>= \x -> Just (x * 2)  -- Nothing

-- do記法
example :: Maybe Int
example = do
    x <- Just 5
    y <- Just 3
    return (x + y)  -- Just 8
```

---

## 練習問題

### 問題9-1：Maybeを使った連鎖計算

`>>=`を使って、文字列を数値に変換し、2倍にする関数を書け。
`readMaybe`（Text.Readモジュール）を使用すること。

```haskell
import Text.Read (readMaybe)

doubleString :: String -> Maybe Int
doubleString s = ?

-- doubleString "5"   → Just 10
-- doubleString "abc" → Nothing
```

### 問題9-2：do記法への書き換え

上記と同じ処理を`do`記法で書け。

```haskell
doubleStringDo :: String -> Maybe Int
doubleStringDo s = do
    ?
```

### 問題9-3：複数のMaybe値の計算

3つの文字列を数値に変換し、その合計を返す関数を書け。
1つでも変換に失敗したら`Nothing`を返すこと。

```haskell
sumThreeStrings :: String -> String -> String -> Maybe Int
sumThreeStrings a b c = ?

-- sumThreeStrings "1" "2" "3"   → Just 6
-- sumThreeStrings "1" "x" "3"   → Nothing
```

### 問題9-4：安全なリスト操作の連鎖

安全な`head`と安全なインデックスアクセスを組み合わせて、
「リストのリストの最初の要素の最初の要素」を安全に取得する関数を書け。

```haskell
safeFirstFirst :: [[a]] -> Maybe a
safeFirstFirst = ?

-- safeFirstFirst [[1,2],[3]]  → Just 1
-- safeFirstFirst [[], [1]]    → Nothing
-- safeFirstFirst []           → Nothing
```

---

## 解答

<details>
<summary>問題9-1の解答</summary>

```haskell
import Text.Read (readMaybe)

doubleString :: String -> Maybe Int
doubleString s = readMaybe s >>= \n -> Just (n * 2)

-- または
doubleString' :: String -> Maybe Int
doubleString' s = readMaybe s >>= (\n -> return (n * 2))

-- または fmapを使って
doubleString'' :: String -> Maybe Int
doubleString'' s = fmap (*2) (readMaybe s)
```

</details>

<details>
<summary>問題9-2の解答</summary>

```haskell
import Text.Read (readMaybe)

doubleStringDo :: String -> Maybe Int
doubleStringDo s = do
    n <- readMaybe s
    return (n * 2)
```

</details>

<details>
<summary>問題9-3の解答</summary>

```haskell
import Text.Read (readMaybe)

sumThreeStrings :: String -> String -> String -> Maybe Int
sumThreeStrings a b c = do
    x <- readMaybe a
    y <- readMaybe b
    z <- readMaybe c
    return (x + y + z)

-- >>=版
sumThreeStrings' :: String -> String -> String -> Maybe Int
sumThreeStrings' a b c =
    readMaybe a >>= \x ->
    readMaybe b >>= \y ->
    readMaybe c >>= \z ->
    Just (x + y + z)
```

</details>

<details>
<summary>問題9-4の解答</summary>

```haskell
safeHead :: [a] -> Maybe a
safeHead []    = Nothing
safeHead (x:_) = Just x

safeFirstFirst :: [[a]] -> Maybe a
safeFirstFirst xss = do
    xs <- safeHead xss   -- 最初のリストを取得
    x  <- safeHead xs    -- その最初の要素を取得
    return x

-- >>=版
safeFirstFirst' :: [[a]] -> Maybe a
safeFirstFirst' xss = safeHead xss >>= safeHead
```

</details>

---

# 第10章：入出力

## 解説

```haskell
-- 基本的なI/O
main :: IO ()
main = do
    putStrLn "What's your name?"
    name <- getLine
    putStrLn ("Hello, " ++ name ++ "!")

-- 主なI/O関数
putStr :: String -> IO ()
putStrLn :: String -> IO ()
print :: Show a => a -> IO ()
getLine :: IO String
readFile :: FilePath -> IO String
writeFile :: FilePath -> String -> IO ()
```

---

## 練習問題

### 問題10-1：基本的な対話

名前と年齢を入力させ、「○○さんは○歳です」と表示するプログラムを書け。

### 問題10-2：数値の入力と計算

2つの数を入力させ、その和・差・積・商を表示するプログラムを書け。

### 問題10-3：繰り返し入力

数を入力させ続け、"quit"と入力されたら合計を表示して終了するプログラムを書け。

### 問題10-4：簡易電卓

以下のような対話型電卓プログラムを作成せよ。

```
> 3 + 5
8
> 10 - 3
7
> 4 * 6
24
> quit
Goodbye!
```

---

## 解答

<details>
<summary>問題10-1の解答</summary>

```haskell
main :: IO ()
main = do
    putStr "名前: "
    name <- getLine
    putStr "年齢: "
    ageStr <- getLine
    let age = read ageStr :: Int
    putStrLn (name ++ "さんは" ++ show age ++ "歳です")
```

</details>

<details>
<summary>問題10-2の解答</summary>

```haskell
main :: IO ()
main = do
    putStr "1つ目の数: "
    s1 <- getLine
    putStr "2つ目の数: "
    s2 <- getLine
    let n1 = read s1 :: Double
        n2 = read s2 :: Double
    putStrLn $ "和: " ++ show (n1 + n2)
    putStrLn $ "差: " ++ show (n1 - n2)
    putStrLn $ "積: " ++ show (n1 * n2)
    putStrLn $ "商: " ++ show (n1 / n2)
```

</details>

<details>
<summary>問題10-3の解答</summary>

```haskell
main :: IO ()
main = loop 0
  where
    loop total = do
        putStr "数を入力 (quitで終了): "
        input <- getLine
        if input == "quit"
            then putStrLn ("合計: " ++ show total)
            else loop (total + read input)
```

</details>

<details>
<summary>問題10-4の解答</summary>

```haskell
main :: IO ()
main = do
    putStrLn "簡易電卓 (quit で終了)"
    loop
  where
    loop = do
        putStr "> "
        input <- getLine
        if input == "quit"
            then putStrLn "Goodbye!"
            else do
                case calculate input of
                    Just result -> print result
                    Nothing     -> putStrLn "エラー"
                loop

    calculate :: String -> Maybe Double
    calculate expr = case words expr of
        [a, "+", b] -> Just (read a + read b)
        [a, "-", b] -> Just (read a - read b)
        [a, "*", b] -> Just (read a * read b)
        [a, "/", b] -> let d = read b in
                       if d == 0 then Nothing
                       else Just (read a / d)
        _ -> Nothing
```

</details>

---

# 第11章：総合問題

## 問題11-1：数値処理

```haskell
-- 素数判定
isPrime :: Int -> Bool

-- n以下の素数のリスト
primesUpTo :: Int -> [Int]

-- 最大公約数（ユークリッドの互除法）
myGcd :: Int -> Int -> Int

-- フィボナッチ数列のn番目（効率的な実装）
fib :: Int -> Integer
```

## 問題11-2：文字列処理

```haskell
-- 回文判定
isPalindrome :: String -> Bool

-- 連続する重複を削除
compress :: Eq a => [a] -> [a]
-- compress "aaabbbcca" → "abca"

-- ランレングス符号化
encode :: Eq a => [a] -> [(Int, a)]
-- encode "aaabbbcca" → [(3,'a'),(3,'b'),(2,'c'),(1,'a')]
```

## 問題11-3：クイックソート

リスト内包表記を使ってクイックソートを実装せよ。

```haskell
quicksort :: Ord a => [a] -> [a]
quicksort = ?
```

## 問題11-4：スタックの実装

```haskell
data Stack a = Stack [a] deriving Show

emptyStack :: Stack a
push :: a -> Stack a -> Stack a
pop :: Stack a -> Maybe (a, Stack a)
peek :: Stack a -> Maybe a
```

---

## 解答

<details>
<summary>問題11-1の解答</summary>

```haskell
isPrime :: Int -> Bool
isPrime n
    | n < 2     = False
    | n == 2    = True
    | even n    = False
    | otherwise = all (\x -> n `mod` x /= 0) [3,5..isqrt n]
  where isqrt = floor . sqrt . fromIntegral

primesUpTo :: Int -> [Int]
primesUpTo n = [x | x <- [2..n], isPrime x]

myGcd :: Int -> Int -> Int
myGcd a 0 = a
myGcd a b = myGcd b (a `mod` b)

fib :: Int -> Integer
fib n = fibs !! n
  where fibs = 0 : 1 : zipWith (+) fibs (tail fibs)
```

</details>

<details>
<summary>問題11-2の解答</summary>

```haskell
isPalindrome :: String -> Bool
isPalindrome s = s == reverse s

compress :: Eq a => [a] -> [a]
compress []       = []
compress [x]      = [x]
compress (x:y:xs)
    | x == y    = compress (y:xs)
    | otherwise = x : compress (y:xs)

encode :: Eq a => [a] -> [(Int, a)]
encode [] = []
encode (x:xs) = (1 + length prefix, x) : encode rest
  where (prefix, rest) = span (== x) xs
```

</details>

<details>
<summary>問題11-3の解答</summary>

```haskell
quicksort :: Ord a => [a] -> [a]
quicksort []     = []
quicksort (p:xs) = quicksort smaller ++ [p] ++ quicksort larger
  where
    smaller = [x | x <- xs, x < p]
    larger  = [x | x <- xs, x >= p]
```

</details>

<details>
<summary>問題11-4の解答</summary>

```haskell
data Stack a = Stack [a] deriving Show

emptyStack :: Stack a
emptyStack = Stack []

push :: a -> Stack a -> Stack a
push x (Stack xs) = Stack (x:xs)

pop :: Stack a -> Maybe (a, Stack a)
pop (Stack [])     = Nothing
pop (Stack (x:xs)) = Just (x, Stack xs)

peek :: Stack a -> Maybe a
peek (Stack [])    = Nothing
peek (Stack (x:_)) = Just x
```

</details>

---

# 付録：テスト用データとヒント

## テスト用データ

```haskell
-- リスト
testList :: [Int]
testList = [1, 2, 3, 4, 5]

-- 木構造
testTree :: Tree Int
testTree = Node 1 (Node 2 Leaf Leaf) (Node 3 Leaf (Node 4 Leaf Leaf))
```

## 解答のヒント

- `read`関数は文字列を数値に変換できますが、失敗する可能性があります
- `readMaybe`関数（Text.Readモジュール）を使用すると安全です
- パターンマッチングでは`[]`（空リスト）と`(x:xs)`（先頭と残り）を使い分けましょう
- 再帰関数では必ず**基底ケース**を考えましょう
- GHCiの`:t`コマンドで型を確認しながら進めましょう

## クイックリファレンス

| 関数 | 型 | 説明 |
|------|-----|------|
| `head` | `[a] -> a` | 先頭要素 |
| `tail` | `[a] -> [a]` | 先頭以外 |
| `map` | `(a -> b) -> [a] -> [b]` | 各要素に適用 |
| `filter` | `(a -> Bool) -> [a] -> [a]` | 条件で抽出 |
| `foldr` | `(a -> b -> b) -> b -> [a] -> b` | 右から畳み込み |
| `zip` | `[a] -> [b] -> [(a, b)]` | 2リストを組に |

| GHCiコマンド | 説明 |
|----------|------|
| `:t 式` | 式の型を表示 |
| `:i 名前` | 情報を表示 |
| `:l ファイル` | ファイルを読み込み |
| `:r` | 再読み込み |
| `:q` | 終了 |

---

**お疲れ様でした！** 全問解けたら、Haskellの基礎は身についています。
