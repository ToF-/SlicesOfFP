# Synopsis

### 1 The Texas Hold'em Kata

Given this input:

    Kc 9s Ks Kd 9d 3c 6d 
    9c Ah Ks Kd 9d 3c 6d
    Ac Qc Ks Kd 9d 3c 
    9h 5s 
    4d 2d Ks Kd 9d 3c 6d
    7s Ts Ks Kd 9d

Return this output:

    Kc 9s Ks Kd 9d 3c 6d Full House (winner)
    9c Ah Ks Kd 9d 3c 6d Two Pair
    Ac Qc Ks Kd 9d 3c 
    9h 5s 
    4d 2d Ks Kd 9d 3c 6d Flush
    7s Ts Ks Kd 9d


### 2 Evaluating some functions

Program == Function Evaluation
    
    sqrt 1764 ⏎

    Data.List.subsequences "ABCD" ⏎

    subtract 2 44 ⏎

    subtract 1 (subtract 1 44) ⏎

    6 * (3 + 4) ⏎

    (*) 6 ((+) 3 4) ⏎

    Data.List.insert 42 [1,32,87] ⏎
    
### 3 A Function Definition

A short program named `WordCount.hs`:
 
    main = interact (\text -> show (length (words text))) 

Compiling and running the program:

    ghc --make WordCount -o wordcount ⏎
    ./wordcount <WordCount.hs ⏎

### 4 Writing a test

A short program named `Specs.hs`:

    import Test.Hspec
    main = hspec 
        (describe "a test" 
            (it "should pass" 
                (2+2  `shouldBe` 4)))

Running the test:

    runhaskell Specs ⏎

### 5 The `$` operator

    import Test.Hspec
    main = hspec $
        describe "a test" $
            it "should pass" $
                2+2  `shouldBe` 4

### 6 Writing a suite of tests

    import Test.Hspec
    main = hspec $ 
        describe "a suite" $ 
            (it "should pass" $ 
                2+2  `shouldBe` 4)
        >>
            (it "should not fail" $
                2*2 `shouldBe` 4)

### 7 Sequencing actions with `do`:

    import Test.Hspec
    main = hspec $ do
        describe "a suite" $ do
            it "should pass" $ do
                2+2  `shouldBe` 4
            it "should not fail" $do
                2*2 `shouldBe` 4

### 8 Expressing distinct cases

    response 'Y' = True
    response 'y' = True
    response 'N' = False
    response 'n' = False

    average []  = 0
    average l   = sum l / length l

### 9 Deconstructing Data

    isOrdered [a,b]   = a <= b
    isOrdered [a,b,c] = isOrdered [a,b] && isOrdered [b,c]

    product []     = 1
    product (x:xs) = x * product xs

### 10 Comparing values

    compare 42 17 ⏎
    compare 17 42 ⏎
    compare 11 11 ⏎

    compare "cat" "dog" ⏎

### 11 Back to Poker Hand

Comparing Cards is not Comparing Strings

    compare "8d" "9c" -- should be LT and is LT
    compare "8d" "8c" -- should be EQ but is GT
    compare "Ah  "Jc" -- should be GT but is LT

### 12 Comparing Cards by Rank

Write a function a function `rank` such that


    describe "comparing card by rank" $ do
        it "should follow the rules of poker" $ do
            compare (rank "8d") (rank "6h") `shouldBe` GT
            compare (rank "4d") (rank "4h") `shouldBe` EQ
            compare (rank "9d") (rank "Th") `shouldBe` LT 
            compare (rank "Td") (rank "Jh") `shouldBe` LT 
            compare (rank "Jd") (rank "Qh") `shouldBe` LT 
            compare (rank "Qd") (rank "Kh") `shouldBe` LT 
            compare (rank "Kd") (rank "Ah") `shouldBe` LT 

### 13 Comparing cards by Suit

Write a function a function `suit` such that


    describe "comparing card by suit" $ do
        it "should follow the rules of poker" $ do
            suit "8d" == suit "6d" `shouldBe` True
            suit "4d" == suit "4h" `shouldBe` False
            suit "9d" == suit "Tc" `shouldBe` True
            suit "Td" == suit "Js" `shouldBe` False

### 14 Types as ways to validate a construct

    rank :: String -> Int
    suit :: String -> Char

`"#@%"` is a valid `String` value. Is it a valid `Card` value?

What is the result of `compare (rank "#&") (rank "18")` ?

comparing cards by rank = extracting and converting the rank part of the card.
comparing cards by suit = extracting and converting the suit part of the card.

Only when comparing cards you know (maybe) that something was wrong in the given input.
You can program silly things like `rank "foo"`

### 15 A (slightly) better type
 
    type Card = (Rank, Suit) 
    type Rank = Int
    type Suit = Char

    rank :: Card -> Rank
    suit :: Card -> Suit

    card :: String -> Card

What makes the type `Card = (Rank,Suit)` better than `String`?

Once the conversion from String to (Int,Char) is done, the comparing takes care of itself.

Bad input is detected at conversion, not comparison.
You can program silly thinks like `rank "8d" + 4807` or `suit "8d" < suit "8h"


### 16 Comparing cards by Rank improved

Write the `card` function so that the test pass

    describe "comparing card by rank" $ do
        it "should follow the rules of poker" $ do
            compare (rank (card "8d")) (rank (card "6h")) `shouldBe` GT
            compare (rank (card "4d")) (rank (card "4h")) `shouldBe` EQ
            compare (rank (card "9d")) (rank (card "Th")) `shouldBe` LT 
            compare (rank (card "Td")) (rank (card "Jh")) `shouldBe` LT 
            compare (rank (card "Jd")) (rank (card "Qh")) `shouldBe` LT 
            compare (rank (card "Qd")) (rank (card "Kh")) `shouldBe` LT 
            compare (rank (card "Kd")) (rank (card "Ah")) `shouldBe` LT 

### 17 Types as a way to think about a problem

    data Suit = Hearts | Clubs | Diamonds | Spades -- an union type
        deriving (Eq, Show)

    data Rank = Two | Three | Four | Five | Six | Seven | Eight | Nine 
              | Ten | Jack | Queen | King | Ace
        deriving (Eq, Ord, Enum, Show)

    type Card = (Rank, Suit)
    rank = fst
    suit = snd
  

The type `Card` can have only 52 values.
Once conversion is done, you can only
 - compare by rank order
 - compare on equality by suit

### 18 Passing Functions to Functions

    import Data.Ord
    :type compare ⏎
    :type comparing ⏎

    comparing abs (-4) 3

    comparing rank (card "8c") (card "5d") ⏎

the function `rank` is passed to the `comparing` function

### 19 Combining Functions

   :type (.) ⏎

    (length . words) "time flies like an arrow" ⏎

    comparing (rank . card) "8c" "5d" ⏎


### 20 List functions: reverse

    reverse "Hello World" ⏎

### 21 Mapping

    :type map ⏎
    map negate [-34,42,17] ⏎

    map sqrt [1,2,3,4,5] ⏎

### 22 Collecting Cards

Write the function `cards` such that

    describe "cards" $ do
        it "should collect cards from a string" $ do
            cards "8d Ah Qc"  `shouldBe` [(Eight,Diamonds),(Ace,Hearts),(Queen,Clubs)]

### 23 Sorting

    sort [42,3,17,1,22,4,38] ⏎

    sortBy compare "HELLO" ⏎

    sortBy (comparing length) (words "time flies like an arrow") ⏎


### 24 Ranks of a hand

Write the function `ranks` such that

    describe "ranks" $ do
        it "should obtain ranks from a list of cards sorted in rank order" $ do
            ranks (cards "8d Ah Qc")  `shouldBe` [Eight,Queen,Ace]

### 25 Grouping

    group "HELLO" ⏎
    
    (group . sort) "Cats and Dogs"

### 26 Groups of Cards

Write the function `groups` such that

    describe "groups" $ do
        it "should obtain groups of ranks from a list of cards, sorted by descending length of group then rank" $ do
            groups (cards "8d Ah Qc 8h 8s")  `shouldBe` [[EIght,Eight,Eight],[Ace],[Queen]]
            groups (cards "8d Ah Qc 8h As")  `shouldBe` [[Ace,Ace][EIght,Eight],[Queen]]

## 27 Categorizing groups of Cards

A data type for Category

    data Category = HighCard | OnePair | TwoPairs | ThreeOfAKind | Straight | Flush
                  | FullHouse | FourOfAKind | StraightFlush | RoyalFlush
        deriving (Eq,Ord,Show)

Write the function `category :: [[Rank]] -> Category` such that

    describe "category" $ do
        it "should determine the category of a hand" $ do
            let hs = ["4s 5d Kc Tc 3d"
                     ,"4s Kd Kc Tc 3d"
                     ,"4s Kd Kc Tc Td"
                     ,"Ts Kd Kc Tc Td"
                     ,"Ts Kd Kc Kc 8d"
                     ,"Ts Kd Kc Kc Kd"]
            map (category.groups.cards) hs ==  
                    [HighCard ,OnePair ,TwoPairs
                    ,FullHouse ,ThreeOfAKind ,FourOfAKind]

### 28 Special categories

A Straight is like a HighCard except that ranks are forming a sequence, e.g. Th 9d 8c 7s 6s

A Flush is like a HighCard except that all the cards have the same suit, e.g. Kh Jh 9h 7h 6h

A Straight Flush is combines the characteristics of a Straight and a Flush, e.g Th 9h 8h 7h 6h 

A Royal Flush is a Straight Flush starting with an Ace e.g. Ah Kh Qh Jh Th

### 29 Guards

Pattern matching can be subjected to conditions, called guards

    power n m | m >= 0    = product (replicate m n)
              | otherwise = error "negative exponent"   

    sign n | n < 0 = -1
           | n > 0 =  1
           | _     =  0

### 30 Detecting a Flush

Write the function `flush` such that

    describe "flush" $ do
        it "should detect when all cards in a hand have the same suit" $ do
            flush (cards "8d Ah 4d 3d Ad") `shouldBe` False
            flush (cards "8h Ah 4h 3h Kh") `shouldBe` True

### 31 Enum typeclass

    fromEnum False ⏎
    fromEnum True ⏎

    fromEnum Ace ⏎

### 32 Detecting a Straight

Given a list of 5 distinct groups of 1 rank each, 
And   the first rank value = the last rank value + 4
Then  the category is Straight

    isStraight [[a],_,_,_,[b]] = fromEnum a == 4 + fromEnum b 
    isStraight _               = False 

### 33 Determining a Ranking

Comparing two hands ranking involves comparing their category, and if their categories are equal, comparing the ranks 

    type Ranking = (Category, [Ranks])

    ranking :: [Cards] -> Ranking

Using the `groups`, `reverse`, `sort`, `ranks`, `isStraight`, `isFlush` functions, write the function `ranking` 


        it "should correctly order a list by ranking" $ do
            let s = ["7s 5c 4d 3d 2c" -- lowest High Card
                    ,"As Kc Qd Jd 9c" -- highest High Card
                    ,"2h 2d 5c 4c 3c" -- lowest Pair
                    ,"Ah Ad Kc Qc Jc" -- highest Pair
                    ,"2c 2s 3s 3c 4h" -- lowest Two Pairs
                    ,"Ac As Ks Kc Jh" -- highest Two Pairs
                    ,"2h 2d 2c 4c 3c" -- lowest Three Of A Kind
                    ,"Ah Ad Ac Qc Jc" -- highest Three Of A Kind
                    ,"5h 4s 3d 2c Ah" -- lowest Straight
                    ,"Ah Ks Qd Jc Th" -- highest Straight
                    ,"7c 5c 4c 3c 2c" -- lowest Flush
                    ,"Ac Kc Qc Jc 9c" -- highest Flush
                    ,"2h 2d 2c 3h 3c" -- lowest Full House
                    ,"Ah Ad Ac Kh Kc" -- highest Full House
                    ,"2c 2s 2h 2d 3c" -- lowest Four Of A Kind
                    ,"Ac As Ah Ad Jc" -- highest Four Of A Kind
                    ,"5c 4c 3c 2c Ac" -- lowest Straight Flush
                    ,"Ah Kh Qh Jh Th"] -- Royal Flush
                isStrictlyOrdered [_] = True
                isStrictlyOrdered (x:y:xs) = x < y && isStrictlyOrdered (y:xs) 
                r = map (ranking.cards) s
            isStrictlyOrdered r `shouldBe` True
