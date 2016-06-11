main :: IO ()
main =
  print answer


answer :: Int
answer =
  maximum (primeFactors 600851475143)


primeFactors :: Int -> [Int]
primeFactors n =
  primeFactorsInternal 2 n


primeFactorsInternal :: Int -> Int -> [Int]
primeFactorsInternal d n =
  if n <= 1 then
    [n]
  else
    let
      times =
        timesDivisible d n

      primes =
        take times (repeat d)

      newN =
        if times > 0 then
          n `div` (d * times)
        else
          n

      newD =
        d + 1
    in
      if newD * newD > newN then
        if newN > 1 then
          newN : primes
        else
          primes
      else
        (primeFactorsInternal newD newN) ++ primes


timesDivisible :: Int -> Int -> Int
timesDivisible d n =
  if n `rem` d == 0 then
    1 + (timesDivisible d (n `div` d))
  else
    0
