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


    

