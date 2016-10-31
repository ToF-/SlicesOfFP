import Test.Hspec
import Data.Char 

data Suit = Hearts | Clubs | Diamonds | Spades -- an union type
    deriving (Eq, Show)

data Rank = Two | Three | Four | Five | Six | Seven | Eight | Nine 
          | Ten | Jack | Queen | King | Ace
    deriving (Eq, Ord, Show)


main = hspec $ do
    describe "comparing card by rank" $ do
        it "should follow the rules of poker" $ do
            compare (rank "8d") (rank "6h") `shouldBe` GT
            compare (rank "4d") (rank "4h") `shouldBe` EQ
            compare (rank "9d") (rank "Th") `shouldBe` LT 
            compare (rank "Td") (rank "Jh") `shouldBe` LT 
            compare (rank "Jd") (rank "Qh") `shouldBe` LT 
            compare (rank "Qd") (rank "Kh") `shouldBe` LT 
            compare (rank "Kd") (rank "Ah") `shouldBe` LT 

    describe "comparing card by suit" $ do
        it "should follow the rules of poker" $ do
            suit "8d" == suit "6d" `shouldBe` True
            suit "4d" == suit "4h" `shouldBe` False
            suit "9d" == suit "Tc" `shouldBe` True
            suit "Td" == suit "Js" `shouldBe` False
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

rank = head
suit = head . tail

        

