

init1 :: [a] -> [a]
init1 [] = error "..."
init1 [x] = []
init1 (x:xs) = x : (init1 xs)

last1 :: [a] -> a
last1 [] = error "..."
last1 [x] = x
last1 (_:x) = last x

take1 :: Int -> [a] -> [a]
take1 0 _ = []
take1 _ [] = []
take1 n (x:xs) = x : take1 (n-1) xs

drop1 :: Int -> [a] -> [a]
drop1 0 xs = xs
drop1 _ [] = []
drop1 n (_:xs) = drop1 (n-1) xs

replicate1 :: Int -> a -> [a]
replicate1 0 _ = []
replicate1 n x = x : replicate(n-1) x