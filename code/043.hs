-- 043.hs
import Test.Hspec

main = hspec $ do
    describe "isFlush" $ do
        it "should detect when all cards have the same suit" $ do
            isFlush (cards "8d Ah 4d 3d Ad") `shouldBe` False
            isFlush (cards "8h Ah 4h 3h Kh") `shouldBe` True
