main =
  print answer


answer :: [Int]
answer = -- [31875000]
  let
    target =
      1000

    fillInBC a =
      takeWhile (\(a, b, c) -> c > b) $ map (triplet target a) [a + 1 ..]

    matches =
      concatMap (filter (validTriplet target) . fillInBC) [1 .. target `div` 3]
  in
    map answerFormat matches


type Triplet =
  (Int, Int, Int)


triplet :: Int -> Int -> Int -> Triplet
triplet target a b =
  (a, b, target - a - b)


validTriplet :: Int -> Triplet -> Bool
validTriplet target (a, b, c) =
  a < b && b < c && a + b + c == target && a ^ 2 + b ^ 2 == c ^ 2


answerFormat :: Triplet -> Int
answerFormat (a, b, c) =
  a * b * c
