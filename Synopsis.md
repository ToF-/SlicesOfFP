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

## 2. Types == Design Helpers
### Types as ways to validate a construct
### Types as ways to think about a problem
## 3. Pattern Matching 
### Expressing distinct cases
### Deconstructing Data
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
