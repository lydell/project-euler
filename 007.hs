import Data.Numbers.Primes (primes)


main =
  print answer -- 104759


answer :: Int
answer =
  primes !! 10001
