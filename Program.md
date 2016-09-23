Fil rouge : autour du kata poker hand - évaluation d'une main de poker

## 1. Programme = Évaluation de fonction

1.1 Écrivez une fonction `square` telle que e.g l'expression `square 3` est évaluée à `9` et l'expression `square 42 == 1764` est évaluée à `True`.  

1.2 Écrivez une foncion `quad` telle que e.g l'expression `quad 2` est évaluée à  `16`.

1.3 Écrivez une fonction `rect` telle que e.g l'expression `rect 5 3 4` est évaluée à `True`

### *ghci*

évaluer une expression:

    6 * 7  ⏎
    42

lier une variable à une expression:

    let a = 42 ⏎
    a * a ⏎
    1764

exemple de liaison d'une variable à une fonction:

    let f x = x + 1 ⏎
    f 32 ⏎
    33

### *runhaskell*

Dans un script `Main.hs` :

    main = putStrLn "hello, world!"

Puis dans le terminal :

    runhaskell Main.hs ⏎
    hello, world!

### *ghc*

    ghc --make Main.hs -o hello ⏎
    ./hello ⏎
    hello, world!

## 2. Typage fort

2.1 Type = collections de valeurs, e.g. `Bool` ou `(Char, Bool)`

2.2 Type = règles et applications possibles sur les valeurs

    sin True ⏎
        No instance for (Floating Bool) arising from a use of ‘sin’
        In the expression: sin True
        In an equation for ‘it’: it = sin True

    True + 3 ⏎
        No instance for (Num Bool) arising from a use of ‘+’
        n the expression: True + 3
        In an equation for ‘it’: it = True + 3
    
2.3 Type = manière de penser un problème

Ecrivez une fonction qui permet de comparer deux cartes au jeu de poker.
- une carte de rang supérieur bat une carte de rang inférieur
- valeurs des rangs par ordre croissant : 2,3,4,5,6,7,8,9,10,jack,queen,king,ace
- deux cartes de couleurs differentes mais de même rang, sont considérées de même valeur
- valeurs des couleurs: hearts,spades,diamonds,clubs

Comment représenter une carte ?
    
Quelle est la meilleure représentation ?

    type Card = [String]
    type Card = (Char,Char)
    type Card = (Int,Char)
    type Card = (Int,Int)
    data Rank = Two,Three,Four,Five,Six,Seven,Eight,Nine,Ten,Jack,Queen,King,Ace
    data Suit = Hearts, Spades, Diamonds, Clubs
    type Card = (Rank,Suit)
        


### `:info` et `:type`

## 3. Pattern Matching

1. Éviter les enchaînements de `if then else`

    fact n = if n == O then 1 else n * fact (n-1)

Modifier `fact` de façon que e.g `fact (-1)` produise une erreur (`error "fact with negative arg"`)

    fact 0 = 1
    fact n | n < 0 = error "fact with negative arg"
    fact n = n * fact (n-1)

2. Déconstruire des valeurs structurées

    let [(a,s)] = lex "foo bar qix" ⏎
    a ⏎
    "foo"
    s ⏎
    " bar qix"

    (1:[]) ⏎
    [1]
    (1:2:[3,4]) ⏎
    [1,2,3,4]

Écrivez une fonction `flush :: [Card] -> Bool` qui renvoie `True` si toutes les cartes d'une main ont la même couleur.

## 4. Fonctions comme valeurs

1. Améliorer la modularité et la composabilité

    sortBy (flip compare) $ map (\n -> (length n, head n)) $ group $ sort $ map rank m

## 5. Transparence référentielle et immutabilité

## 6. Evaluation paresseuse

## 7. Currification

