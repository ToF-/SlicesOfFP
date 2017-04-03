import System.Environment
import System.Random
import System.Random.Shuffle

preamble = unlines $ 
    ["\\documentclass[A4paper,10pt]{article}",
    "\\usepackage[english]{babel}",
    "\\usepackage[latin1]{inputenc}",
    "\\usepackage[usenames,dvipsnames]{xcolor}",
    "\\usepackage{listings}",
    "\\usepackage{verbatim}",
    "\\usepackage{fancyvrb}",
    "\\usepackage{moreverb}",
    "\\usepackage{tikz}",
    "\\usetikzlibrary{calc}",
    "\\newcommand{\\Size}{2.36cm}",
    "\\tikzset{Square/.style={",
    "inner sep=0pt,",
    "text width=\\Size, ",
    "minimum size=\\Size,",
    "draw=black,",
    "align=center,",
    "}",
    "}",
    "\\input{../Beamer/Haskell.tex}",
    "\\pagestyle{empty}",
    "\\begin{document}",
    "\\lstMakeShortInline[language=Haskell,basicstyle=\\ttfamily]~"]
postamble = unlines $ ["\\end{document}"]

prepicture = unlines $ [
    "\\begin{center}",
    "\\begin{tikzpicture}[draw=black, thick, x=\\Size,y=\\Size]"]
postpicture= unlines $ [
     "\\end{tikzpicture}",
     "\\end{center}"]

showNode :: (Int, String) -> String
showNode (n, s) = "\\node [Square] at ($(" ++ show c ++ ", " ++ show r ++ ")-(0.5,0.5)$) {\\large "++ s ++"};"
    where 
    c = n `mod` 5
    r = n `div` 5

ws = ["\\emph{pattern\\\\matching}","~head~","~tail~","~sort~","~sortBy~","~compare~","~type~","~data~","type class","~deriving~","~Eq~","~Ord~","~Enum~","~Show~",
            "\\emph{guards}","\\emph{lists}","\\emph{tuples}","~comparing~","\\emph{function\\\\composition}","~map~","~flip~","~group~","~fromEnum~","~toEnum~","~concat~"]

sheet :: StdGen -> Int -> IO ()
sheet _ 0 = putStr ""
sheet gen n = do 
    let items = zip [0..] $ shuffle' ws (length ws) gen
        text = prepicture ++ (concatMap showNode items) ++ postpicture
    putStr $ text
    gen' <- newStdGen
    sheet gen' (n-1)
main = do
    args <- getArgs
    gen <- newStdGen
    putStr preamble
    sheet gen (read (args!!0))
    putStr postamble
