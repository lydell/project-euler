main =
  print answer


answer :: Int
answer =
  sum $ filter even $ takeWhile (< 4000000) $ entireFibonacciSequence


-- http://blog.srinivasan.biz/software/fibonacci-numbers-the-slow-way-or-the-fast-and-lazy-way
entireFibonacciSequence :: [Int]
entireFibonacciSequence =
  1 : 1 : zipWith (+) entireFibonacciSequence (tail entireFibonacciSequence)
