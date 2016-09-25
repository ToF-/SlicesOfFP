import Test.Hspec

main = hspec $ describe "" $ do
        it "" $ do
            sqrt (9 * 9) `shouldBe` 9
            sqrt 9 * 9 `shouldBe` 27

