main =
  print answer -- 906609


answer :: Int
answer =
  let
    threeDigitNumbers =
      [100 .. 999]

    threeDigitNumbersCombinations =
      combinations threeDigitNumbers

    products =
      map (uncurry (*)) threeDigitNumbersCombinations
  in
    maximum $ filter isPalindrome products


combinations :: [a] -> [(a, a)]
combinations [] =
  []
combinations list@(first : rest) =
  map ((,) first) list ++ combinations rest


isPalindrome :: Int -> Bool
isPalindrome n =
  let
    str =
      show n

    half =
      (length str) `div` 2
  in
    take half str == take half (reverse str)
