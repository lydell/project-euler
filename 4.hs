main :: IO ()
main =
  print answer


answer :: Int
answer =
  let
    threeDigitNumbers =
      [100..999]

    threeDigitNumbersCombinations =
      combinations threeDigitNumbers

    products =
      map (\(a, b) -> a * b) threeDigitNumbersCombinations
  in
    maximum (filter isPalindrome products)


combinations :: [a] -> [(a, a)]
combinations list =
  case list of
    first : rest ->
      (map ((,) first) list) ++ (combinations rest)

    _ ->
      []


isPalindrome :: Int -> Bool
isPalindrome n =
  let
    str =
      show n

    half =
      (length str) `div` 2
  in
    (take half str) == (take half (reverse str))
