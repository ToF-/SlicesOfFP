-- 023.hs
import Test.Hspec

main = hspec $ do
    describe "comparing card by rank" $ do
        it "should follow the rules of poker" $ do
            compare (rank (card "8d")) (rank (card "6h")) `shouldBe` GT
            compare (rank (card "4d")) (rank (card "4h")) `shouldBe` EQ
            compare (rank (card "9d")) (rank (card "Th")) `shouldBe` LT 
            compare (rank (card "Td")) (rank (card "Jh")) `shouldBe` LT 
            compare (rank (card "Jd")) (rank (card "Qh")) `shouldBe` LT 
            compare (rank (card "Qd")) (rank (card "Kh")) `shouldBe` LT 
            compare (rank (card "Kd")) (rank (card "Ah")) `shouldBe` LT 

