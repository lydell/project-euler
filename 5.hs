import Data.List (nub)


main :: IO ()
main =
  print answer


answer :: Int
answer =
  product $ merge $ map primeFactors [1..20]


merge :: (Eq a, Foldable t) => t [a] -> [a]
merge list =
  foldl mergeInternal [] list


mergeInternal :: Eq a => [a] -> [a] -> [a]
mergeInternal result list =
  result ++ (concat $ map (mergeInsert result list) $ nub list)


mergeInsert :: Eq a => [a] -> [a] -> a -> [a]
mergeInsert result list item =
  let
    numItemsInList =
      length (filter (== item) list)

    numItemsInResult =
      length (filter (== item) result)
  in
    take (max 0 (numItemsInList - numItemsInResult)) (repeat item)


primeFactors :: Int -> [Int]
primeFactors n =
  primeFactorsInternal 2 n


primeFactorsInternal :: Int -> Int -> [Int]
primeFactorsInternal d n =
  if n <= 1 then
    [n]
  else
    let
      times =
        timesDivisible d n

      primes =
        take times (repeat d)

      newN =
        if times > 0 then
          n `div` (d ^ times)
        else
          n

      newD =
        d + 1
    in
      if newD ^ 2 > newN then
        if newN > 1 then
          newN : primes
        else
          primes
      else
        (primeFactorsInternal newD newN) ++ primes


timesDivisible :: Int -> Int -> Int
timesDivisible d n =
  if n `rem` d == 0 then
    1 + (timesDivisible d (n `div` d))
  else
    0
