-- 024.hs
type Card = (Rank, Suit) 
type Rank = Int
type Suit = Char

rank :: Card -> Rank
rank = fst

suit :: Card -> Suit
suit = snd


card :: String -> Card
card [r,s] = (charToRank r, charToSuit s)

charToRank :: Char -> Rank
charToRank 'A' = 14
charToRank 'K' = 13
charToRank 'Q' = 12
charToRank 'J' = 11
charToRank 'T' = 10
charToRank c = Data.Char.digitToInt c

charToSuit :: Char -> Suit
charToSuit = id
