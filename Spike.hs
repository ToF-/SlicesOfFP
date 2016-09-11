
main = interact (unlines . map (show . (*1.0685) . read) . lines)
