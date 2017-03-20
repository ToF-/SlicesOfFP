-- 018.hs
import Test.Hspec

main = hspec $ do
    describe "comparing card by suit" $ do
        it "should follow the rules of poker" $ do
            suit "8d" == suit "6d" `shouldBe` True
            suit "4d" == suit "4h" `shouldBe` False
            suit "9d" == suit "Tc" `shouldBe` True
            suit "Td" == suit "Js" `shouldBe` False
