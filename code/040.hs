-- 040.hs
import Test.Hspec

main = hspec $ do
    describe "category" $ do
        it "should determine the category of a hand" $ do
            let hs = ["4s 5d Kc Tc 3d"
                     ,"4s Kd Kc Tc 3d"
                     ,"4s Kd Kc Tc Td"
                     ,"Ts Kd Kc Kc 8d"
                     ,"Ts Kd Kc Tc Td"
                     ,"Ts Kd Kc Kc Kd"]
            map (category.groups.cards) hs ==  
                    [HighCard, OnePair, TwoPairs
                    ,ThreeOfAKind, FullHouse, FourOfAKind]
