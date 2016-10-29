import Test.Hspec
main = hspec $ 
    describe "a suite" $ do
        describe "a test" $ do
            it "should pass" $ do
                2+2  `shouldBe` 4

            it "should not fail" $do
                2*2 `shouldBe` 4

        describe "another test" $ do
            it "should pass too" $ do
                3+1  `shouldBe` 4
