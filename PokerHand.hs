import Data.List (sort,group,sortBy)
import Data.Ord(comparing)

data Suit = Hearts | Clubs | Diamonds | Spades deriving (Eq,Show)
data Rank = Two | Three | Four | Five | Six | Seven | Eight | Nine | Ten
    | Jack | Queen | King | Ace deriving (Eq,Ord,Show,Enum)


type Card = (Rank,Suit)
rank = fst
suit = snd

data Category = HighCard | OnePair | TwoPair | ThreeOfAKind | Straight
    | Flush | FullHouse | FourOfAKind | StraightFlush | RoyalFlush
    deriving (Eq,Ord,Show)

type Ranks = [[Rank]]
type Ranking = (Category,Ranks)

categorize :: (Ranks,Bool) -> Category
categorize ([[Ace],_,_,_,[Ten]],True) = RoyalFlush
categorize ([[a],_,_,_,[b]],True) | fromEnum a - fromEnum b == 4 = StraightFlush 
categorize ([[_,_,_,_],_],False) = FourOfAKind
categorize ([[_,_,_],[_,_]],False) = FullHouse
categorize ([_,_,_,_,_],True) = Flush
categorize ([[a],_,_,_,[b]],False) | fromEnum a - fromEnum b == 4 = Straight
categorize ([[_,_,_],_,_],False) = ThreeOfAKind
categorize ([[_,_],[_,_],_],False) = TwoPair
categorize ([[_,_],_,_,_],False) = OnePair
categorize ([_,_,_,_,_],False) = HighCard
   
ranks :: [Card] -> Ranks
ranks = sortBy (flip (comparing (\g -> (length g, head g)))) . group . sort . map rank

full :: [Card] -> Bool
full = (== 1) . length . group . map suit

ranking :: [Card] -> Ranking
ranking h = (categorize (rs, full h), rs)
    where rs = ranks h



