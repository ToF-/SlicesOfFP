import Test.Hspec
import Data.Char 

data Suit = Hearts | Clubs | Diamonds | Spades -- an union type
    deriving (Eq, Show)

data Rank = Two | Three | Four | Five | Six | Seven | Eight | Nine 
          | Ten | Jack | Queen | King | Ace
    deriving (Eq, Ord, Show)

type Card = (Rank,Suit)

main = hspec $ do
    describe "rank" $ do
        it "should yield the first half of a card" $ do
            rank (card "8H")  `shouldBe` Eight
            rank (card "AH")  `shouldBe` Ace
    describe "suit" $ do
        it "should yield the suit of a card" $ do
            suit (card "8H")  `shouldBe` Hearts
            suit (card "AD")  `shouldBe` Diamonds

    describe "compareRanks" $ do
        it "should compare cards based on rank" $ do
            compare (rank (card "8D")) (rank (card "6H"))  `shouldBe` GT
            compare (rank (card "4D")) (rank (card "4H"))  `shouldBe` EQ
            compare (rank (card "9D")) (rank (card "TH"))  `shouldBe` LT 
            compare (rank (card "TD")) (rank (card "JH"))  `shouldBe` LT 
            compare (rank (card "JD")) (rank (card "QH"))  `shouldBe` LT 
            compare (rank (card "QD")) (rank (card "KH"))  `shouldBe` LT 
            compare (rank (card "KD")) (rank (card "AH"))  `shouldBe` LT 

card :: String -> Card
card [r,s] = (charToRank r, charToSuit s)
    where 
    charToRank '2' = Two
    charToRank '3' = Three 
    charToRank '4' = Four 
    charToRank '5' = Five
    charToRank '6' = Six
    charToRank '7' = Seven
    charToRank '8' = Eight
    charToRank '9' = Nine 
    charToRank 'T' = Ten
    charToRank 'J' = Jack
    charToRank 'Q' = Queen
    charToRank 'K' = King
    charToRank 'A' = Ace

    charToSuit 'H' = Hearts
    charToSuit 'C' = Clubs
    charToSuit 'D' = Diamonds
    charToSuit 'S' = Spades 

rank = fst
suit = snd

compareRanks a b = compare (rank a) (rank b)
        

