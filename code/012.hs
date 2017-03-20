-- 012.hs
import Test.Hspec

main = hspec $ do
    describe "average" $ do
        it "should calculate the average" $ do
            average [ ]        `shouldBe` 0
            average [2, 4, 12] `shouldBe` 6
