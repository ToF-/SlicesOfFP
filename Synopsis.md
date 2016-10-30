# Synopsis

## 1. Program == Function Evaluation

###Evaluating some functions
    
    sqrt 1764 ⏎

    Data.List.subsequences "ABCD" ⏎

    subtract 2 44 ⏎

    subtract 1 (subtract 1 44) ⏎

    6 * (3 + 4) ⏎

    (*) 6 ((+) 3 4) ⏎

    Data.List.insert 42 [1,32,87] ⏎
    
### A Function Definition
A short program named `WordCount.hs`:
 
    main = interact (\text -> show (length (words text))) 

Compiling and running the program:

    ghc --make WordCount -o wordcount ⏎
    ./wordcount <WordCount.hs ⏎

### Writing a test

A short program named `Specs.hs`:

    import Test.Hspec
    main = hspec 
        (describe "a test" 
            (it "should pass" 
                (2+2  `shouldBe` 4)))

Running the test:

    runhaskell Specs ⏎

### The `$` operator

    import Test.Hspec
    main = hspec $
        describe "a test" $
            it "should pass" $
                2+2  `shouldBe` 4

### Writing a suite of tests

    import Test.Hspec
    main = hspec $ 
        describe "a suite" $ 
            (it "should pass" $ 
                2+2  `shouldBe` 4)
        >>
            (it "should not fail" $
                2*2 `shouldBe` 4)

### Sequencing actions with `do`:

    import Test.Hspec
    main = hspec $ do
        describe "a suite" $ do
            it "should pass" $ do
                2+2  `shouldBe` 4
            it "should not fail" $do
                2*2 `shouldBe` 4

## 2. Pattern Matching 

### Expressing distinct cases

    response 'Y' = True
    response 'y' = True
    response 'N' = False
    response 'n' = False

    average []  = 0
    average l   = sum l / length l

### Deconstructing Data

    isOrdered [a,b]   = a <= b
    isOrdered [a,b,c] = isOrdered [a,b] && isOrdered [b,c]

    product []     = 1
    product (x:xs) = x * product xs

### Comparing values

    compare 42 17 ⏎
    compare 17 42 ⏎
    compare 11 11 ⏎

    compare "cat" "dog" ⏎

### Comparing Cards is not Comparing Strings

    compare "8D" "9C" -- should be LT and is LT
    compare "8D" "8C" -- should be EQ but is GT
    compare "AH  "JC" -- should be GT but is LT

### Comparing Cards

Write a function `card` and a function `rank` such that

compareCards :: String -> String -> Ord
compareCards s t = compare (rank (card s)) (rank (card t))

    describe "comparing card by rank" $ do
        it "should follow the rules of poker" $ do
            compareCards "8D" "6H"  `shouldBe` GT
            compareCards "4D" "4H"  `shouldBe` EQ
            compareCards "9D" "TH"  `shouldBe` LT 
            compareCards "TD" "JH"  `shouldBe` LT 
            compareCards "JD" "QH"  `shouldBe` LT 
            compareCards "QD" "KH"  `shouldBe` LT 
            compareCards "KD" "AH"  `shouldBe` LT 

QQQQ
then find a suitable type synonym for card and for rank

## 3. Types == Design Helpers
### Types as ways to validate a construct

    type Card = String  
    type Rank = Int   
    type Suit = Char

    rank :: Card -> Rank
    suit :: Card -> Suit


`"#@%"` is a valid `String` value. Is it a valid `Card` value?

What is the result of `compare (rank (card "#&")) (rank (card "18"))` ?

### A (slightly) better product type
 
    type Card = (Rank, Suit) -- a product type
    type Rank = Char
    type Suit = Char

    rank = fst
    suit = snd

What makes `(Rank,Suit)` better than `String`?

### Write the `card` function

    import Test.Hspec
    main = hspec $ do
        describe "rank" $ do
            it "should yield the rank of a card" $ do
                rank (card "8H")  `shouldBe` '8'
                rank (card "AH")  `shouldBe` 'A'

        describe "suit" $ do
            it "should yield the suit of a card" $ do
                suit (card "8H")  `shouldBe` 'H'
                suit (card "AD")  `shouldBe` 'D'

### Types as a way to think about a problem

    data Suit = Hearts | Clubs | Diamonds | Spades -- an union type
        deriving (Eq, Show)

    data Rank = Two | Three | Four | Five | Six | Seven | Eight | Nine 
              | Ten | Jack | Queen | King | Ace
        deriving (Eq, Ord, Show)

### New types mean new tests

    describe "rank" $ do
        it "should yield the first half of a card" $ do
            rank (card "8H")  `shouldBe` Eight
            rank (card "AH")  `shouldBe` Ace
    describe "suit" $ do
        it "should yield the suit of a card" $ do
            suit (card "8H")  `shouldBe` Hearts
            suit (card "AD")  `shouldBe` Diamonds

    describe "comparingRank" $ do
        it "should compare cards based on rank" $ do
            compare Eight Six `shouldBe` GT
            compare Ace Ace  `shouldBe` EQ
            compare Queen King `shouldBe` LT 

## 4. Functions as Values
### Passing Functions 
### Combining Functions
## 5. List Functions
### Mapping
### Folding
### Sorting
### Grouping
## 6. Algebraic Types and Type Classes
## A data type for Rank
## A data type for Ranking
