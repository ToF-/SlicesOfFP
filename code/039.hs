-- 039.hs
data Category = HighCard | OnePair | TwoPairs | ThreeOfAKind 
              | Straight | Flush | FullHouse | FourOfAKind 
              | StraightFlush | RoyalFlush
    deriving (Eq,Ord,Show)
