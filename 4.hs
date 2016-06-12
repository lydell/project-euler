main :: IO ()
main =
  print answer


answer :: Int
answer =
  let
    threeDigitNumbers =
      [100..999]

    threeDigitNumbersCombinations =
      combinations threeDigitNumbers threeDigitNumbers

    products =
      map (\(a, b) -> a * b) threeDigitNumbersCombinations
  in
    maximum (filter isPalindrome products)


combinations :: Eq b => [a] -> [b] -> [(a, b)]
combinations list1 list2 =
  if list2 == [] then
    []
  else
    case list1 of
      first : rest ->
        (map ((,) first) list2) ++ (combinations rest (drop 1 list2))

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
