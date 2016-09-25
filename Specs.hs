import Test.Hspec

type Card = (Int,Char)

rank :: Card -> Int
rank _ = 2

main = hspec $ describe "" $ do
        it "" $ do
            sqrt (9 * 9) `shouldBe` 9
            sqrt 9 * 9 `shouldBe` 27
        it "" $ do
            rank (2,'C') `shouldBe` 2

