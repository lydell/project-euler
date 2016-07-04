import Data.Numbers.Primes (primeFactors)


main =
  print answer -- 6857


answer :: Int
answer =
  maximum $ primeFactors 600851475143
