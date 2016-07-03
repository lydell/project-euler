import Data.List (nub)
import Common (primeFactors)


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
