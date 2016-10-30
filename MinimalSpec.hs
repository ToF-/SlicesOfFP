import Test.Hspec
import Data.Char 
main = hspec $ do
    describe "rank" $ do
        it "should yield the first half of a card" $ do
            rank "8H"  `shouldBe` '8'
            rank "AH"  `shouldBe` 'A'
    describe "suit" $ do
        it "should yield the suit of a card" $ do
            suit "8H"  `shouldBe` 'H'
            suit "AD"  `shouldBe` 'D'

    describe "comparingRank" $ do
        it "should compare cards based on rank" $ do
            compareRanks '8' '6'  `shouldBe` GT
            compareRanks '4' '4'  `shouldBe` EQ
            compareRanks '9' 'T'  `shouldBe` LT 
            compareRanks 'T' 'J'  `shouldBe` LT 
            compareRanks 'J' 'Q'  `shouldBe` LT 
            compareRanks 'Q' 'K'  `shouldBe` LT 
            compareRanks 'K' 'A'  `shouldBe` LT 

rank [r,_] = r
suit [_,s] = s

compareRanks a b = compare (rankOrder a) (rankOrder b)
    where 
    rankOrder 'A' = 14
    rankOrder 'K' = 13
    rankOrder 'Q' = 12
    rankOrder 'J' = 11
    rankOrder 'T' = 10
    rankOrder  c  = digitToInt c
        

