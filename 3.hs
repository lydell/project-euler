import Common (primeFactors)


main =
  print answer


answer :: Int
answer = -- 6857
  maximum $ primeFactors 600851475143
