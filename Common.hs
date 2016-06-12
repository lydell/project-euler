module Common (allPrimes, primeFactors) where


allPrimes :: [Int]
allPrimes =
  generatePrimes [2..]


generatePrimes :: [Int] -> [Int]
generatePrimes numbers =
  case numbers of
    first : rest ->
      first : generatePrimes (filter (\n -> n `rem` first /= 0) rest)

    _ ->
      []


primeFactors :: Int -> [Int]
primeFactors n =
  primeFactorsInternal allPrimes n


primeFactorsInternal :: [Int] -> Int -> [Int]
primeFactorsInternal remainingPrimes n =
  if n <= 1 then
    [n]
  else
    let
      d : newRemainingPrimes =
        remainingPrimes

      times =
        timesDivisible d n

      primes =
        take times (repeat d)

      newN =
        n `div` (d ^ times)
    in
      if (head remainingPrimes) ^ 2 > newN then
        if newN > 1 then
          newN : primes
        else
          primes
      else
        (primeFactorsInternal newRemainingPrimes newN) ++ primes


timesDivisible :: Int -> Int -> Int
timesDivisible d n =
  if n `rem` d == 0 then
    1 + (timesDivisible d (n `div` d))
  else
    0
