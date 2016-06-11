import Common (primeFactors)


main :: IO ()
main =
  print answer


answer :: Int
answer =
  maximum (primeFactors 600851475143)
