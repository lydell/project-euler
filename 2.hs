main :: IO ()
main =
  print answer


answer :: Int
answer =
  sum $ filter even $ fibonacciSequence (4000000 - 1) [1, 1]


fibonacciSequence :: Int -> [Int] -> [Int]
fibonacciSequence maxNum startList =
  case startList of
    first : second : _ ->
      let
        next =
          first + second
      in
        if next > maxNum then
          startList
        else
          fibonacciSequence maxNum (next : startList)

    _ ->
      startList
