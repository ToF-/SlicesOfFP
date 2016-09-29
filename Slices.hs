import Test.Hspec

main = hspec $ do
    describe "sqrt" $ do
        it "should yield the square root of a number" $ do
        let sr = sqrt 9
        sr * sr `shouldBe` 9 
