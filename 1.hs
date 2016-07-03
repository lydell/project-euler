main =
  print answer


answer :: Int
answer = -- 233168
  sum $ filter (\n -> n `mod` 3 == 0 || n `mod` 5 == 0) [1 .. 999]
