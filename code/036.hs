-- 036.hs
import Test.Hspec

main = hspec $ do
    describe "ranks" $ do
        it "should give the sorted ranks of a hand" $ do
            ranks (cards "8d Ah Qc")  `shouldBe` [Ace, Queen, Eight]
