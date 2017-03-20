-- 048.hs
import Test.Hspec

main = hspec $ do
    describe "ranking" $ do
        it "should keep the ranking of a hand" $ do
            ranking (cards "2c 2s 3s 3c 4h")
                `shouldBe` (TwoPairs, [Three,Three,Two,Two,Four])

            ranking (cards "2c 2s As 3c 4h")
                `shouldBe` (OnePair, [Two,Two,Ace,Four,Three])
