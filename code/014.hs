-- 014.hs
ordered [a,b]   = a <= b
ordered [a,b,c] = ordered [a,b] && ordered [b,c]

product []     = 1
product (x:xs) = x * product xs
