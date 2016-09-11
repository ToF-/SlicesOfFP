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

    main = interact id

## Slice 2

    main = interact (show . (*1.0685) . read)

## Slice 3

    main = interact (unlines . map (show . (*1.0685) . read) . lines)

## Refactor

    type Price = Double

    totalPrice :: Price -> Price
    totalPrice p = p * 1.0685

    process :: (String -> String) -> IO ()
    process f = interact (unlines . map f . lines )

    main :: IO ()
    main = process (show . totalPrice . read)

## Slice 4

    readPrice :: String -> [Price]
    readPrice = map fst . reads

    showPrice :: [Price] -> String
    showPrice [p] = show p
    showPrice []  = "not a correct price"

    main :: IO ()
    main = process (showPrice . map totalPrice . readPrice)

## Refactoring

    type FPrice = [Price]

    fMap :: (Price -> Price) -> (FPrice -> FPrice)
    fMap = map

    readPrice :: String -> FPrice
    readPrice = map fst . reads

    showPrice :: FPrice -> String
    showPrice [p] = show p
    showPrice []  = "not a correct price"

    main :: IO ()
    main = process (showPrice . fMap totalPrice . readPrice)

## Refactoring to prepare for second argument

    type Quantity = Integer

    totalPrice :: Quantity -> Price -> Price
    totalPrice q p = fromInteger q * p * 1.0685

    main :: IO ()
    main = process (showPrice . fMap (totalPrice 1) . readPrice)

## Slice 5


    main = process (showPrice . (\[q,p] -> fMap (totalPrice (read q)) (readPrice p)). words)

##  Refactoring





