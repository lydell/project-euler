import Data.Numbers.Primes (primes)


main =
  print answer -- 142913828922


answer :: Int
answer =
  sum $ takeWhile (< 2000000) primes
