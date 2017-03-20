-- 009.hs
import Test.Hspec

main = hspec $ do
    describe "label" $ do
        it "should be an english label" $ do
            label "WO" `shouldBe` "Wool"
            label "CO" `shouldBe` "Cotton"
            label "PA" `shouldBe` "Nylon"
            label "PC" `shouldBe` "Acrylic"
            label "XX" `shouldBe` "--- unknown label ---"
            label "YY" `shouldBe` "--- unknown label ---"
