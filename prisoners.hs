import System.Random.Shuffle

prisoners = [0..99]

pcycle cupboard drawerNo prisonerNo attempts
  | cupboard !! drawerNo == prisonerNo = attempts
  | otherwise = pcycle cupboard (cupboard !! drawerNo) prisonerNo (attempts + 1)

main = do
  rand <- shuffleM prisoners
  let result = map (\x -> pcycle rand x x 1) prisoners
  print result
  putStr $ "Did the prisoners surive? "
  return $ all (< 51) result

