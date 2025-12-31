-- 7-1

data Tree a = Leaf | Node a (Tree a) (Tree a) deriving (Show)

depth :: Tree a -> Int
depth Leaf = 0
depth (Node _ l r) = 1 + max (depth l) (depth r)

-- 7-2
treeToList :: Tree a -> [a]
treeToList Leaf = []
treeToList (Node x l r) = treeToList l ++ [x] ++ treeToList r

-- 7-3
data Color = Red | Green | Blue

instance Show Color where
  show Red = "赤"
  show Green = "緑"
  show Blue = "青"

-- 7-4
data Point = Point Double Double

instance Eq Point where
  (Point x1 y1) == (Point x2 y2) = x1 == x2 && y1 == y2

-- 7-5
safeIndex :: [a] -> Int -> Maybe a
safeIndex [] _ = Nothing
safeIndex (x : _) 0 = Just x
safeIndex (_ : xs) n
  | n < 0 = Nothing
  | otherwise = safeIndex xs (n - 1)

addMaybe :: Maybe Int -> Maybe Int -> Maybe Int
addMaybe Nothing _ = Nothing
addMaybe _ Nothing = Nothing
addMaybe (Just x) (Just y) = Just (x + y)
