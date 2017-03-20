-- 038.hs
import Test.Hspec

main = hspec $ do
    describe "groups" $ do
        it "should group and sort the ranks of a hand" $ do
            groups (cards "8d Ah Qc 8h 8s")  `shouldBe`
                 [[Eight,Eight,Eight],[Ace],[Queen]]

            groups (cards "8d Ah Qc 8h As")  `shouldBe`
                 [[Ace,Ace],[Eight,Eight],[Queen]]
