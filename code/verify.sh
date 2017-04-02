#!/usr/bin/env bash

for file in `ls 0*.hs | grep -v solution | grep -E -v '(014|016|022|024|025|029|039|045|047|050|052)'`
do
    if [ ! \( -L $file \) ]
    then
        echo "Executing $file"
        solutionFile=${file%.*}.solution.hs
        if [[ "$file" =~ "032" ]]
        then
            solutionFile="023.solution.hs"
        fi
        if [ -e $solutionFile ]
        then
cat <<EOF | cat - imports.hs $file $solutionFile | runhaskell || exit 2
import Data.Char
import Data.List
import Data.Ord
EOF
        else
            runhaskell $file || exit 1
        fi
    fi
done

cat <<EOF | cat - 032.solution.hs 023.solution.hs | runhaskell || exit 2
import Data.Char
import Data.List
import Data.Ord
EOF
