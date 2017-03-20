-- 017.hs
import Test.Hspec

main = hspec $ do
    describe "comparing card by rank" $ do
        it "should follow the rules of poker" $ do
            compare (rank "8d") (rank "6h") `shouldBe` GT
            compare (rank "4d") (rank "4h") `shouldBe` EQ
            compare (rank "9d") (rank "Th") `shouldBe` LT 
            compare (rank "Td") (rank "Jh") `shouldBe` LT 
            compare (rank "Jd") (rank "Qh") `shouldBe` LT 
            compare (rank "Qd") (rank "Kh") `shouldBe` LT 
            compare (rank "Kd") (rank "Ah") `shouldBe` LT 
