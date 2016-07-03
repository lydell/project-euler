main =
  print answer


answer :: Int
answer =
  let
    numbers =
      [1 .. 100]

    sumOfSquares =
      sum $ map (^ 2) numbers

    squareOfSum =
      (sum numbers) ^ 2
  in
    squareOfSum - sumOfSquares
