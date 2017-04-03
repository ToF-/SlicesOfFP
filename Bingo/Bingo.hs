import System.Random
import System.Random.Shuffle

preamble = unlines $ 
    ["\\documentclass[10pt]{article}",
    "\\usepackage{xstring}",
    "\\usepackage{tikz}",
    "\\usetikzlibrary{calc}",
    "\\newcommand{\\Size}{3.25cm}",
    "\\tikzset{Square/.style={",
    "inner sep=0pt,",
    "text width=\\Size, ",
    "minimum size=\\Size,",
    "draw=black,",
    "align=center,",
    "}",
    "}",
    "\\begin{document}",
    "\\begin{tikzpicture}[draw=black, thick, x=\\Size,y=\\Size]"]
postamble = unlines $
    ["\\end{tikzpicture}",
     "\\end{document}"]

showNode :: (Int, String) -> String
showNode (n, s) = "\\node [Square] at ($(" ++ show c ++ ", " ++ show r ++ ")-(0.5,0.5)$) {\\large "++ s ++"};"
    where 
    c = n `mod` 5
    r = n `div` 5

ws = words "foo bar qux baz baaz meh blah wow"

main = do 
    gen <- getStdGen
    let items = zip [0..] $ shuffle' ws (length ws) gen
        text = preamble ++ (concatMap showNode items) ++ postamble
    putStr $ text
