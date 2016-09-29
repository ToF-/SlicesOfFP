## 1. Écrire un test

    main = hspec $ do
        describe "sqrt" $ do
            it "should yield the square root of a number" $ do
            let n = sqrt 9
            n * n `shouldBe` 9 
        import Test.Hspec
    
    runhaskell Specs.hs ⏎
    sqrt
        should yield the square root of a number

    Finished in 0.0012 seconds
    1 example, 0 failures 

## 2. Valeurs, expressions, fonctions

Dans *ghci*:

    let celsiusToFahrenheit t = t * 1.8 + 32

    let fahrenheitToCelsius t = (t - 32) / 1.8     

    celsiusToFahrenheit 20 ⏎
    68.0

    fahrenheitToCelsius 68 ⏎
    20.0

Dans un script :
    
    
    celsiusToFahrenheit t = t * 1.8 + 32

    fahrenheittocelsius t = (t - 32) / 1.8     

    main = do
        print $ celsiusToFahrenheit 20
        print $ fahrenheitToCelsius 68 


    runhaskell Temps.hs ⏎
    68.0
    20.0

## 3. Typage Fort

type comme collection de valeurs 

    let c = "7D"   -- many many possible values..
    let d = "8H"

type comme règles sur les opérations possibles avec les valeurs

    compare c d ⏎
    LT
    compare "KH" "AD"  -- expecting LT of course.. ⏎
    GT

type comme manière de penser un problème

    type Card = (Rank, Suit)
    type Rank = Int
    type Suit = Char

    compareCards :: Card -> Card -> Ord

## 4. Pattern Matching

    rank :: Card -> Rank
    rank (r,s) = r

écrivez la fonction `suit`

écrivez la fonction `compareCards`

## 5. Data et type class

    data Rank = Two | Three | Four | Five | Six | Seven | Eight | Nine | Ten | Jack | Queen | King | Ace

    data Suit = Hearts | Clubs | Diamonds | Spades

rendre le type `Rank` ordonnable

rendre le type `Suit` comparable pour l'égalité


exo : faire passe Two < Three

## 6. Listes

Faite un type Hand

## 7. Gard et pattern sur list

exo : ecrire la fonction maxRank

## 8. Function as value

découverte de map

exo : simplifier maxRank et rank

## 9. Composition de fonction et application partielle

## 10. Introduction aux lambda

usage de sort reverse group map + lambda pour trouver les groupes et leurs tailles => groupByRank

## 11. Introduction du where

exo : fonction flush




