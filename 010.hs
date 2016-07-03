import Data.Numbers.Primes (primes)


main = -- 142913828922
  print answer


answer :: Int
answer =
  sum $ takeWhile (< 2000000) primes
