-- 016.hs
import Test.Hspec

main = hspec $ do
    describe "compare" $ do
        describe "using Strings as Cards" $ do
            it "cannot give satisfactory comparisons" $ do
                compare "Td" "Jc"  `shouldBe` LT
                compare "8d" "8c"  `shouldBe` EQ
                compare "Ah" "Jc"  `shouldBe` GT
