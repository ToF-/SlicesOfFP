-- 015.hs
import Test.Hspec

main = hspec $ do
    describe "compare" $ do
        it "should compare values of any type of class Ord" $ do
            compare 42 17       `shouldBe` GT
            compare 'A' 'B'     `shouldBe` LT
            compare 11.3 11.3   `shouldBe` EQ
            compare "cat" "dog" `shouldBe` LT
