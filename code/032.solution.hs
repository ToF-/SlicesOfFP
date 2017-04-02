import Test.Hspec

main = hspec $ do
    describe "comparing card by rank" $ do
        it "should follow the rules of poker" $ do
            comparing (rank . card) "8d" "6h" `shouldBe` GT
            comparing (rank . card) "4d" "4h" `shouldBe` EQ
            comparing (rank . card) "9d" "Th" `shouldBe` LT 
            comparing (rank . card) "Td" "Jh" `shouldBe` LT 
            comparing (rank . card) "Jd" "Qh" `shouldBe` LT 
            comparing (rank . card) "Qd" "Kh" `shouldBe` LT 
            comparing (rank . card) "Kd" "Ah" `shouldBe` LT 

