-- 013.hs
average [ ]  = 0
average xs   = sum xs `div` length xs
