module AdvancedHaskellSamples where

-- フィボナッチ数列の無限リストを生成
fib :: [Integer]
fib = 0 : 1 : zipWith (+) fib (tail fib)

-- 特定の条件（この場合は偶数かつ10000以下）を満たすフィボナッチ数のリストを生成
filteredFibs :: [Integer]
filteredFibs = filter even $ takeWhile (<= 10000) fib

-- リスト内の数値に対して特定の操作（この場合はそれぞれの数を2倍にする）を適用
processedFibs :: [Integer]
processedFibs = map (*2) filteredFibs

-- 結果を表示するためのヘルパー関数
printProcessedFibs :: IO ()
printProcessedFibs = print processedFibs

main :: IO ()
main = do
  putStrLn "Processed Fibonacci numbers:"
  printProcessedFibs