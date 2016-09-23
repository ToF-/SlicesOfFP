type Price = Double
type Quantity = Integer

taxIncluded :: Price -> Price
taxIncluded p = p * 1.0685

total :: Quantity -> Price -> Price
total q p = fromInteger q * p


totalPrice :: [String] -> FValue Price
totalPrice [q,p] = fmap taxIncluded (app (fmap total (readN q)) (readN p))
totalPrice _     = Error

app :: FValue (a -> b) -> FValue a -> FValue b
app f a = join (fmap (\g -> fmap g a) f)
    where join (Value a) = a
          join Error     = Error

main :: IO ()
main = process (showPrice . totalPrice . words) 

readN :: (Read a, Num a) => String -> FValue a
readN s = case reads s of 
    [(a,_)] -> Value a
    []      -> Error

showPrice :: FValue Price -> String
showPrice (Value p) = show p
showPrice Error  = "something went wrong"

process :: (String -> String) -> IO ()
process f = interact (unlines . map f . lines )

data FValue a = Value a | Error deriving (Show,Eq)
instance Functor FValue where
    fmap f (Value a) = Value (f a)
    fmap _ Error     = Error
