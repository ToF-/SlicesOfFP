-- 050.hs
promote :: Ranking -> Ranking
promote (HighCard,[Ace,Five,_,_,_]) = (Straight,
                                      [Five,Four,Three,Two,Ace])
promote (HighCard,rs) | isStraight rs = (Straight, rs)
promote r = r

flushes :: Ranking -> Bool -> Ranking
flushes True (HighCard,rs) = (Flush, rs)
flushes True (Straight,[Ace,_,_,_,_]) = (RoyalFlush, [Ace,King,Queen,Jack,Ten])
flushes True (Straight,rs) = (StraightFlush rs)
flushes False r = r
