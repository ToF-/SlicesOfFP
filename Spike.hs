
process :: (String -> String) -> IO ()
process f = interact (unlines . map f . lines )

main :: IO ()
main = process (show . (*1.0685) . read)

