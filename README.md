# SlicesOfFP
Slices of Functional Programming

An exploration of Functional Programming, Functors, Applicative Functors, and Monads

Objectives:

- to give a taste of functional programming applied to a mundane problem
- to quickly review some fundamentals of FP in Haskell:
    - Program as function evaluation
        suppression de la notion de flux de contrôle -> réduction de la complexité du programme sur lequel on raisonne

        f(2) + f(3)

        var a = f(2)
        var b = f(3)
        res = a + b


        = a + b 
        where a = f(2)
              b = f(3)

        Fil rouge appli banquaire ?

    - Strong Typing 
        type = premiere barrière de tests
        type = manière de penser un problème
        Inférence de type de Haskell

        Date de mouvement en chaine de caractère ?
        Mouvement en chaine de caractère ?

    - Pattern Matching
        Expressivité
        Suppression des séquences de if (mais on va du plus particulier au plus général)
        Déconstruction
        
        sum [] = 0
        sum (mouvement:mouvements) = …

    - Functions as Values 
        First class citizen
        Composabilité

        filter (>100) mouvements => error
        map getValue mouvements

        f.g => réecrire

    - Referential Transparency / Immutabilité
        var x = exp => on peut remplacer x par exp partout dans le code
        Pas de surprise / effet de bord
        F appellé avec le même argument donnera toujours la même valeur
        Preuve de programme plus facile
        Parralelisation facilité
        Tout est valeur (pas equals/hashcode)
        Déclaratif
        
        Map reduce à trouver
        Paradox du bateau d'Ulysse

    - Laziness
        Evaluation faite uniquement à la demande
        Simplification

        Calcul sur les 10 derniers mouvements
        head . sort
        Suite de fibo
        Liste infinie

        let l = [5,1,(error "oops")]
        head l

        indexer la liste des mouvements

    - Currification
        Application partiel
        Passage d'application partiel
        f avec n argument == f 1 argument qui retourne une fonction à n-1 arguments

        map (+) l => oops
        map (+2) l => ok

        conversion des mouvements dans une devise

- to explore more advanced constructs
    - Functors
    - Applicative Functors
    - Monads  
    
