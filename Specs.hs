import Test.Hspec

data Rank = Two | Three | As
    deriving (Eq, Show, Ord)
type Suit = Char
type Card = (Rank,Suit)

rank :: Card -> Rank
rank (r,_) = r


main = hspec $ describe "" $ do
        it "" $ do
            sqrt (9 * 9) `shouldBe` 9
            sqrt 9 * 9 `shouldBe` 27
        it "" $ do
            rank (Two,'C') `shouldBe` Two
            rank (Three,'D') `shouldBe` Three
        it "compare" $ do
            Two < Three `shouldBe` True
