import Data.List (sort, group, maximumBy)
import Data.Ord (comparing)

-- 平均値を計算
mean :: [Double] -> Double
mean xs = sum xs / fromIntegral (length xs)

-- 中央値を計算
median :: [Double] -> Double
median xs
  | odd len   = sorted !! (len `div` 2)
  | otherwise = (sorted !! (len `div` 2 - 1) + sorted !! (len `div` 2)) / 2
  where sorted = sort xs
        len = length xs

-- 最頻値を計算
mode :: [Double] -> [Double]
mode xs = map fst . filter ((==maxCount) . snd) . map (\x -> (head x, length x)) . group . sort $ xs
  where maxCount = maximum . map length . group . sort $ xs

-- テストデータ
testData :: [Double]
testData = [1, 2, 4, 4, 4, 5, 5, 7, 9]

-- 結果を表示
main :: IO ()
main = do
  putStrLn $ "Mean: " ++ show (mean testData)
  putStrLn $ "Median: " ++ show (median testData)
  putStrLn $ "Mode: " ++ show (mode testData)