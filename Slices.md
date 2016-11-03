## Slices of Functional Programming
Xavier Détant

Christophe Thibaut


----


### The Texas Hold'em Kata

Given this input:

    Kc 9s Ks Kd 9d 3c 6d 
    9c Ah Ks Kd 9d 3c 6d
    Ac Qc Ks Kd 9d 3c 
    9h 5s 
    4d 2d Ks Kd 9d 3c 6d
    7s Ts Ks Kd 9d

When I run the program

Then the output is

    Kc 9s Ks Kd 9d 3c 6d Full House (winner)
    9c Ah Ks Kd 9d 3c 6d Two Pair
    Ac Qc Ks Kd 9d 3c 
    9h 5s 
    4d 2d Ks Kd 9d 3c 6d Flush
    7s Ts Ks Kd 9d


----


### Program = Function Evaluation

Lauch *ghci* and try some functions

    sqrt 1764 ⏎

    Data.List.subsequences "ABCD" ⏎

    subtract 2 44 ⏎

    subtract 1 (subtract 1 44) ⏎

    6 * (3 + 4) ⏎

    (*) 6 ((+) 3 4) ⏎

    Data.List.insert 42 [1,32,87] ⏎


----


### Writing a test

A short program named *Specs.hs*:

    import Test.Hspec
    main = hspec 
        (describe "a test" 
            (it "should pass" 
                (2+2  `shouldBe` 4)))

Running the test:

    runhaskell Specs ⏎


----


### Sequencing actions with *do*:

    import Test.Hspec
    main = hspec $ do
        describe "a suite" $ do
            it "should pass" $ do
                2+2  `shouldBe` 4
            it "should not fail" $do
                2*2 `shouldBe` 4

----


### Let's write some functions

Write a function *response* that passes this test:

    import Test.Hspec
    main = hspec $ do
        describe "response" $ do
            it "should be a yes or a no" $ do
                response 'N' `shouldBe` False
                response 'n' `shouldBe` False
                response 'Y' `shouldBe` True
                response 'y' `shouldBe` True

----


### Pattern Matching: Expressing distinct cases 


    response 'Y' = True
    response 'y' = True
    response 'N' = False
    response 'n' = False

----

### Lists: a way to collect values of the same type

Ghci:

	1 : 2 : 3 : [] ⏎

	'a' : 'b' : 'c' : "" ⏎

	[4,8] ++ [0,7] ⏎

	head [4,8,0,7] ⏎

	tail [4,8,0,7]  ⏎

    reverse "Hello World" ⏎


----


#### Let's write some functions

Write a function *average* that passes this test:

        describe "average" $ do
            it "should calculate the average" $ do
                average [ ]        `shouldBe` 0.0
                average [2, 4, 12] `shouldBe` 6.0

----


### Pattern Matching: Expressing distinct cases 


    average [ ]  = 0.0
    average xs   = sum xs / length xs


----


### Pattern Matching: Deconstructing Data 

Two examples:

    isOrdered [a,b]   = a <= b
    isOrdered [a,b,c] = isOrdered [a,b] && isOrdered [b,c]

    product []     = 1
    product (x:xs) = x * product xs


----


### Comparing values


    describe "compare" $ do
        it "should compare values of any type of class Ord" $ do
            compare 42 17  `shouldBe` GT
            compare 17 42  `shouldBe` LT
            compare 11 11  `shouldBe` EQ

            compare "cat" "dog" `shouldBe` LT


----


### Comparing Cards can't work with Strings

    describe "using Strings as Cards" $ do
        it "cannot give satisfactory comparisons" $ do
            compare "8d" "9c"  `shouldBe` LT
            compare "8d" "8c"  `shouldBe` EQ
            compare "Ah" "Jc"  `shouldBe` GT


----


### How to compare cards by rank ?

Write a function `rank` that passes this test:


    describe "comparing card by rank" $ do
        it "should follow the rules of poker" $ do
            compare (rank "8d") (rank "6h") `shouldBe` GT
            compare (rank "4d") (rank "4h") `shouldBe` EQ
            compare (rank "9d") (rank "Th") `shouldBe` LT 
            compare (rank "Td") (rank "Jh") `shouldBe` LT 
            compare (rank "Jd") (rank "Qh") `shouldBe` LT 
            compare (rank "Qd") (rank "Kh") `shouldBe` LT 
            compare (rank "Kd") (rank "Ah") `shouldBe` LT 

Hint:

    rank ['A',_] = 14
    rank ['K',_] = 13
    . . .


----


### How to compare cards by suit

Write a function `suit` that passes this test

    describe "comparing card by suit" $ do
        it "should follow the rules of poker" $ do
            suit "8d" == suit "6d" `shouldBe` True
            suit "4d" == suit "4h" `shouldBe` False
            suit "9d" == suit "Tc" `shouldBe` True
            suit "Td" == suit "Js" `shouldBe` False


----


### Types are a way to validate my constructs

We have types:

    rank :: String -> Int
    suit :: String -> Char

But:

- every String value is not a valid Card value
- ` rank False ` or ` rank 3.1415 ` are not legal
- but ` rank "Foo" ` is still legal
- `compare (rank "#&") (rank "18")` == ... ?
- only when comparing fails we know we had incorrect data

----


### Tuples: a way to gather values of different types

Ghci:

	:type (EQ,'@', False) ⏎

	:type ('A',True) ⏎

	fst ('A', True) ⏎

	snd ('A', True)  ⏎


----


### Types are a way to think about the problem
 
A (slighty) better design, with a new function: `Card`

    type Card = (Rank, Suit) 
    type Rank = Int
    type Suit = Char

    rank :: Card -> Rank
    suit :: Card -> Suit

    card :: String -> Card

Better because:

- once conversion is done, the comparing takes care of itself
- bad input is detected at conversion, not in comparisons
- but: you can still do silly things like ` rank (4807,'@') `


----


### Comparing cards by Rank improved

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


----


### Types as a way to think about a problem

    data Suit = Hearts | Clubs | Diamonds | Spades -- an union type
        deriving (Eq, Show)

    data Rank = Two | Three | Four | Five | Six | Seven | Eight | Nine 
              | Ten | Jack | Queen | King | Ace
        deriving (Eq, Ord, Enum, Show)

    type Card = (Rank, Suit)
    rank = fst
    suit = snd
  

- the type `Card` can have only 52 values.
- once conversion is done, you can only

	- compare by rank order (no illegal rank allowed)
	- compare on equality by suit (no illegal suit allowed)


----

# Checkpoint #1 

We have the proper types to describe our values

We have our main feature: comparing cards

#Well Done!!


----


### Passing Functions to Functions

    import Data.Ord ⏎

    :type compare ⏎

    :type comparing ⏎

    comparing abs (-4) 3 ⏎

    :load PokerHand.hs ⏎

    comparing rank (card "8c") (card "5d") ⏎

the function `rank` is passed to the `comparing` function


----


### Combining Functions

    :type (.) ⏎

    (length . words) "time flies like an arrow" ⏎

    comparing (rank . card) "8c" "5d" ⏎

`(f . g) x == f (g x)` 


----

### Combining Functions

Refactor the test using `comparing` and the `. ` operator

    describe "comparing card by rank" $ do
        it "should follow the rules of poker" $ do
            compare (rank (card "8d")) (rank (card "6h")) `shouldBe` GT
            compare (rank (card "4d")) (rank (card "4h")) `shouldBe` EQ
            compare (rank (card "9d")) (rank (card "Th")) `shouldBe` LT 
            compare (rank (card "Td")) (rank (card "Jh")) `shouldBe` LT 
            compare (rank (card "Jd")) (rank (card "Qh")) `shouldBe` LT 
            compare (rank (card "Qd")) (rank (card "Kh")) `shouldBe` LT 
            compare (rank (card "Kd")) (rank (card "Ah")) `shouldBe` LT 


----


### Mapping a function to a list of values

    :type map ⏎
    map negate [-34,42,17] ⏎

    map sqrt [1,2,3,4,5] ⏎


----


### Collecting Cards

Write the function `cards` such that

    describe "cards" $ do
        it "should collect cards from a string" $ do
            cards "8d Ah Qc"  `shouldBe`
                 [(Eight,Diamonds),(Ace,Hearts),(Queen,Clubs)]


----


### Sorting

    sort [42,3,17,1,22,4,38] ⏎

    sortBy compare "HELLO" ⏎

    sortBy (comparing length) (words "time flies like an arrow") ⏎

