-- 006.hs
import Test.Hspec

main = hspec $ do
    describe "a suite" $ do
        it "should pass" $ do
            2+2  `shouldBe` 4
        it "should not fail" $ do
            2*2 `shouldBe` 4
