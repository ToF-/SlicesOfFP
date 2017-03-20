-- 045.hs
isStraight :: [Rank] -> Bool
isStraight [a,_,_,_,b] = fromEnum a == 4 + fromEnum b 
isStraight _               = False 
