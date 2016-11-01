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

Write a function *average* that passes this test:

        describe "average" $ do
            it "should calculate the average" $ do
                average [ ]        `shouldBe` 0.0
                average [2, 4, 12] `shouldBe` 6.0

----


### Pattern Matching: Expressing distinct cases 


    response 'Y' = True
    response 'y' = True
    response 'N' = False
    response 'n' = False

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



