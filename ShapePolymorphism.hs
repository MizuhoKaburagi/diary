module ShapePolymorphism where

-- より抽象的なShape型クラスを定義
class Shape a where
  area :: a -> Double
  perimeter :: a -> Double

-- Circle型の洗練された定義
data Circle = Circle { radius :: Double }

instance Shape Circle where
  area (Circle r) = pi * r ^ 2
  perimeter (Circle r) = 2 * pi * r

-- Rectangle型の洗練された定義
data Rectangle = Rectangle { width :: Double, height :: Double }

instance Shape Rectangle where
  area (Rectangle w h) = w * h
  perimeter (Rectangle w h) = 2 * (w + h)

-- Shapeインターフェースを利用する高度な操作
describeShape :: (Shape a) => a -> String
describeShape shape = "Area: " ++ show (area shape) ++ ", Perimeter: " ++ show (perimeter shape)

-- 主関数での使用例
main :: IO ()
main = do
  let circle = Circle 5
  let rectangle = Rectangle 4 7
  putStrLn $ "Circle: " ++ describeShape circle
  putStrLn $ "Rectangle: " ++ describeShape rectangle