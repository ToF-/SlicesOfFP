import Test.Hspec

main = hspec $ 
    describe "a test" $ do
        it "should pass" $ do
            2+2  `shouldBe` 4
        
        it "should not fail" $ do
            2*2 `shouldBe` 4
