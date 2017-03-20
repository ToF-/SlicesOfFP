-- 047.hs
import Test.Hspec

type Ranking = (Category, [Rank])

main = hspec $ do
    describe "Ranking" $ do
        it "should correctly compare two ranking values" $ do 
            (OnePair,[Ace,Ace,Ten,Eight,Five]) 
                > (OnePair, [Ace,Ace,Eight,Seven,Two])
                 `shouldBe` True
