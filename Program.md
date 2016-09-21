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

Écrivez une fonction qui compare deux dates :

    compDate 20160920 20160531 ⏎
    1
    compDate 20160920 20160920 ⏎
    0
    compDate 20160920 20170920 ⏎
    -1

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

Écrivez une fonction `sum` qui somme tous les nombres d'une liste

## 4. Fonctions comme valeurs

1. Améliorer la modularité et la composabilité

    filter (\n -> n >= 100) [42, 170, 4807, 25] ⏎
    [170, 4807]

    let price (_, _, pr) = pr
    let qty (_, qt, _)   = qt
    let id  (i, _, _)    = i
    let items = [("AP", 42, 100.00), ("BA", 23, 250.00), ("CH", 18, 349.32)]
    map price items
    [100.00, 250.00, 349.32]
    map qty items
    [42, 23, 18]
    zipWith (*) (map price items) (map qty items)
    map (\item -> price item * qty item) items

