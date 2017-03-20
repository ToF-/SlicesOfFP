import Test.Hspec

main = hspec $ do
    describe "ranking" $ do
        it "should correctly order a list by ranking" $ do
            let s = ["7s 5c 4d 3d 2c" ,"As Kc Qd Jd 9c"
                    ,"2h 2d 5c 4c 3c" ,"Ah Ad Kc Qc Jc"
                    ,"2c 2s 3s 3c 4h" ,"Ac As Ks Kc Jh"
                    ,"2h 2d 2c 4c 3c" ,"Ah Ad Ac Qc Jc"
                    ,"5h 4s 3d 2c Ah" ,"Ah Ks Qd Jc Th"
                    ,"7c 5c 4c 3c 2c" ,"Ac Kc Qc Jc 9c"
                    ,"2h 2d 2c 3h 3c" ,"Ah Ad Ac Kh Kc"
                    ,"2c 2s 2h 2d 3c" ,"Ac As Ah Ad Jc"
                    ,"5c 4c 3c 2c Ac" ,"Ah Kh Qh Jh Th"]
                isOrdered :: Ord(a) => [a] -> Bool
                isOrdered [_] = True
                isOrdered (x:y:xs) = x < y && isOrdered (y:xs) 
                r = map (ranking.cards) s
            isOrdered r `shouldBe` True
        
data Suit = Hearts | Clubs | Diamonds | Spades
    deriving (Eq, Show)

data Rank = Two | Three | Four | Five | Six | Seven | Eight 
          | Nine | Ten | Jack | Queen | King | Ace
    deriving (Eq, Ord, Enum, Show)

type Card = (Rank, Suit)
type Ranking = (Category,[Rank])

rank :: Card -> Rank
suit :: Card -> Suit
card :: String -> Card

rank = fst
suit = snd
card _ = (Two,Hearts)
cards _ = []
ranks _ = []

groups _ = []

data Category = HighCard | OnePair | TwoPairs | ThreeOfAKind 
              | Straight | Flush | FullHouse | FourOfAKind 
              | StraightFlush | RoyalFlush
    deriving (Eq,Ord,Show)

category _ = HighCard 

isFlush _ = False

promote :: Ranking -> Ranking
promote (HighCard,[Ace,Five,_,_,_]) = (Straight,
                                      [Five,Four,Three,Two,Ace])
promote (HighCard,rs) | isStraight rs = (Straight, rs)
promote r = r

flushes :: Bool -> Ranking -> Ranking
flushes True (HighCard,rs) = (Flush, rs)
flushes True (Straight,[Ace,_,_,_,_]) = (RoyalFlush, [Ace,King,Queen,Jack,Ten])
flushes True (Straight,rs) = (StraightFlush, rs)
flushes False r = r

isStraight :: [Rank] -> Bool
isStraight [a,_,_,_,b] = fromEnum a == 4 + fromEnum b 
isStraight _               = False 

ranking cs = flushes (isFlush cs) (promote (cat, rs))
    where
    cat = category gs
    rs  = concat   gs
    gs  = groups (ranks cs)
