import Common (isPrime, primeFactors)


main :: IO ()
main =
  print answer


answer :: Int
answer =
  last $ take 10001 $ filter isPrime [2..]
