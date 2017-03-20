-- 034.hs
import Test.Hspec

main = hspec $ do
    describe "cards" $ do
        it "should collect cards from a string" $ do
            cards "8d Ah Qc"  `shouldBe`
                 [(Eight,Diamonds),(Ace,Hearts),(Queen,Clubs)]
