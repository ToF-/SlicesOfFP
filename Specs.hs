import Test.Hspec

type Card = (Int,Char)

rank :: Card -> Int
rank (r,_) = r


main = hspec $ describe "" $ do
        it "" $ do
            sqrt (9 * 9) `shouldBe` 9
            sqrt 9 * 9 `shouldBe` 27
        it "" $ do
            rank (2,'C') `shouldBe` 2
            rank (4,'D') `shouldBe` 4

