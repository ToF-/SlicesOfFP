-- 022.hs
type Card = (Rank, Suit) 
type Rank = Int
type Suit = Char

rank :: Card -> Rank
suit :: Card -> Suit
card :: String -> Card
