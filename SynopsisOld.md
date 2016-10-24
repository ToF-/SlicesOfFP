# Synopsis

## Product
Accept 3 inputs from the user:

- How many items
- Price per item
- 2-letter state code

Output the total price. Give a discount based on the total price, add state tax based on the state and the discounted price.

    +-------------+---------------+    +-------+----------+
    | Order Value | Discount Rate |    | State | Tax Rate |
    +-------------+---------------+    +-------+----------+
    |   $1,000    |       3%      |    |  UT   |  6.85%   |
    |   $5,000    |       5%      |    |  NV   |  8.00%   |
    |   $7,000    |       7%      |    |  TX   |  6.25%   |
    |   $10,000   |       10%     |    |  AL   |  4.00%   |
    |   $50,000   |       15%     |    |  CA   |  8.25%   |
    +-------------+---------------+    +-------+----------+

### Additional Constraints

Make the total price rounded to the nearest cent.

The program runs in a terminal and should continually read the imput, and output calculated total price.

The program shouldn't halt, but signal any error in input.

### Example

Given this input:

    1 42 UT
    1000 42 CA

the program should output:

    44.88
    40918.5

## Slice 1

Write a program that copies input to output using `interact :: (String -> String) -> IO ()` and `id :: a -> a`

    main = interact id

## Slice 2

Using `read :: Read a => String -> a`, `show :: Show a => a -> String`, sections and function composition, write a program that convert input into a number, adds a tax rate of 6.85%, then display the result.

    main = interact (show . (*1.0685) . read)

## Slice 3

Using `lines :: String -> [String]` and `unlines :: [String] -> String` and `map :: (a -> b) -> [a] -> [b]`, have the program treat each line as an input for price calculation. 

    main = interact (unlines . map (show . (*1.0685) . read) . lines)

## Refactor

Separate concerns. Document types.

    type Price = Double

    taxIncluded :: Price -> Price
    taxIncluded p = p * 1.0685

    process :: (String -> String) -> IO ()
    process f = interact (unlines . map f . lines )

    main :: IO ()
    main = process (show . taxIncluded . read)

## Slice 4

Using `reads :: Read a => ReadS a` and pattern matching, write a program that doesn't halt when input is not a valid number.

    readPrice :: String -> [Price]
    readPrice s = case reads s of
        [(v,_)] -> v
        []      -> []

    showPrice :: [Price] -> String
    showPrice [p] = show p
    showPrice []  = "oops"

    main :: IO ()
    main = process (showPrice . map taxIncluded . readPrice)

## Refactoring to prepare for second argument

    taxIncluded :: Price -> Price
    taxIncluded p = p * 1.0685

    total :: Quantity -> Price -> Price
    total q p = fromInteger q * p

    main :: IO ()
    main = process (showPrice . map (taxIncluded . (total 1)) . readPrice)

## Slice 5


    main = process (showPrice . (\[q,p] -> map (taxIncluded . (total (read q)) (readPrice p)) . words) 

##  Refactoring

    totalPrice :: [String] -> [Price]
    totalPrice [q,p] = map taxIncluded (map (total (read q)) (readPrice p))

    main = process (showPrice . totalPrice . words) 

## Slice 6


    totalPrice :: [String] -> [Price]
    totalPrice [q,p] = map taxIncluded (app (map total (readQuantity q)) (readPrice p))
        where 
            app [f] a = map f a
            app []  _ = []

## Refactoring

    app :: [a -> b] -> [a] -> [b]
    app f a = concat (map (\g -> map g a) f)

    app (map (*) [42]) [5] ⏎
    [210]
    (*) `map` [42] `app` [5] ⏎
    [210]
    (*) `map` [42] `app` [] ⏎
    []
    (*) `map` [] `app` [5] ⏎
    []
    (*) `map` [] `app` [] ⏎
    
