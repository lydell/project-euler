import Common (allPrimes)


main =
  print answer


answer :: Int
answer =
  allPrimes !! 10001
