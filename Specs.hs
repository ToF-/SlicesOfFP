import Test.Hspec
import Data.List

data Rank = Two | Three | As
    deriving (Eq, Show, Ord)
type Suit = Char
type Card = (Rank,Suit)
type Hand = [Card]

rank :: Card -> Rank
rank = fst

maxRank = maximum . map rank


groupByRank :: Hand -> [(Int,Rank)]
groupByRank = rsort . map (\g -> (length g, head g)) . group . sort . map rank
    where
        rsort :: (Ord a) => [a] -> [a]
        rsort = reverse . sort

main = hspec $ describe "" $ do
        it "" $ do
            sqrt (9 * 9) `shouldBe` 9
            sqrt 9 * 9 `shouldBe` 27
        it "" $ do
            rank (Two,'C') `shouldBe` Two
            rank (Three,'D') `shouldBe` Three
        it "compare" $ do
            Two < Three `shouldBe` True
        it "high card" $ do
            maxRank [(Two,'C'),(As,'D'),(Three,'C')] `shouldBe` As
