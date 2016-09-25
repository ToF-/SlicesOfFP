## 0. Comment écrire un test

shouldBe

## 1. Valeurs et Expressions

une expression :

une fonction appliquée à une valeur :

## 1.bis Comment écrire plusieurs tests

Anti-sèche

import Test.Hspec

main = hspec $ describe "sqrt" $ do
        it "should give square root" $ do
            sqrt (9 * 9) `shouldBe` 9

## 2. Typage Fort

type comme collection de valeurs 

type comme règles sur les opérations possibles avec les valeurs

type comme manière de penser un problème

## 3. Programme = évaluation de fonction

## 4. Pattern Matching

écrivez la fonction suit

## 5. Data et type class

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




