module Common (allPrimes, primeFactors) where


allPrimes :: [Int]
allPrimes =
  generatePrimes [2..]


generatePrimes :: [Int] -> [Int]
generatePrimes numbers =
  case numbers of
    head : tail ->
      head : generatePrimes (filter (\n -> n `rem` head /= 0) tail)

    _ ->
      []


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
          n `div` (d ^ times)
        else
          n

      newD =
        d + 1
    in
      if newD ^ 2 > newN then
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
