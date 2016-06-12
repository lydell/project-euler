import Common (allPrimes)


main :: IO ()
main =
  print answer


answer :: Int
answer =
  allPrimes !! 10001
