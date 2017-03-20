-- 052.hs
ranking cs = flushes (isFlush cs) (promote (cat, rs))
    where
    cat = category gs
    rs  = concat   gs
    gs  = groups (ranks cs)
