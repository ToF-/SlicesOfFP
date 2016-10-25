import Test.Hspec

main = hspec $ 
    describe "a test" $ 
        (it "should pass" $ 
            2+2  `shouldBe` 4)
        >>
        (it "should not fail" $
            2*2 `shouldBe` 4)
