#!/usr/bin/env bash

for file in `ls 0*.hs | grep -v solution | grep -E -v '(014|016|022|024|025|029)'`
do
    if [ ! \( -L $file \) ]
    then
        echo "Executing $file"
        solutionFile=${file%.*}.solution.hs
        if [ -e $solutionFile ]
        then
cat <<EOF | cat - imports.hs $file $solutionFile | runhaskell || exit 2
import Data.Char
EOF
        else
            runhaskell $file || exit 1
        fi
    fi
done
