
type Price = Double
type Quantity = Integer

totalPrice :: Quantity -> Price -> Price
totalPrice q p = fromInteger q * p * 1.0685

type FPrice = [Price]
type FQuantity = [Quantity]

fMap :: (Price -> Price) -> (FPrice -> FPrice)
fMap = map

readPrice :: String -> FPrice
readPrice = map fst . reads

showPrice :: FPrice -> String
showPrice [p] = show p
showPrice []  = "not a correct price"

process :: (String -> String) -> IO ()
process f = interact (unlines . map f . lines )

main :: IO ()
main = process (showPrice . (\[q,p] -> fMap (totalPrice (read q)) (readPrice p)). words)

