module PokerHands
where
import Data.Char
import Data.List

data Suit = Hearts | Clubs | Diamonds | Spades
    deriving (Eq, Show)

data Rank = Two | Three | Four | Five | Six | Seven | Eight 
          | Nine | Ten | Jack | Queen | King | Ace
    deriving (Eq, Ord, Enum, Show)

type Card = (Rank, Suit)

rank :: Card -> Rank
suit :: Card -> Suit
card :: String -> Card

rank = fst
suit = snd

card [r,s] = (charToRank r, charToSuit s)




charToRank :: Char -> Rank
charToRank 'A' = Ace
charToRank 'K' = King
charToRank 'Q' = Queen
charToRank 'J' = Jack
charToRank 'T' = Ten
charToRank c   = toEnum ((digitToInt c) - 2)

charToSuit :: Char -> Suit
charToSuit 's' = Spades
charToSuit 'd' = Diamonds
charToSuit 'c' = Clubs
charToSuit 'h' = Hearts

cards :: String -> [Card]
cards = map card . words

ranks :: [Card] -> [Rank]
ranks = sortBy (flip compare) . map rank
