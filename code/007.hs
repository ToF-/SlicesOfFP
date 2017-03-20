-- 007.hs
import Test.Hspec

main = hspec $ do
    describe "response" $ do
        it "should be a yes or a no" $ do
            response 'N' `shouldBe` False
            response 'n' `shouldBe` False
            response 'Y' `shouldBe` True
            response 'y' `shouldBe` True

