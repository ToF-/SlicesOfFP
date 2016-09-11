type Price = Double
type Quantity = Integer

taxIncluded :: Price -> Price
taxIncluded p = p * 1.0685

total :: Quantity -> Price -> Price
total q p = fromInteger q * p


totalPrice :: [String] -> [Price]
totalPrice [q,p] = map taxIncluded (app (map total (readQuantity q)) (readPrice p))

app :: [a -> b] -> [a] -> [b]
app f a = concat (map (\g -> map g a) f)

main :: IO ()
main = process (showPrice . totalPrice . words) 

readPrice :: String -> [Price]
readPrice = map fst . reads

readQuantity :: String -> [Quantity]
readQuantity = map fst . reads

showPrice :: [Price] -> String
showPrice [p] = show p
showPrice []  = "not a correct price"

process :: (String -> String) -> IO ()
process f = interact (unlines . map f . lines )

