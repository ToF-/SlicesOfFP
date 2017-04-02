#! /usr/bin/awk -f
BEGIN { slide = 1 }
$0 ~ /^% SLIDE/ { next }
$0 ~ /\\begin\{frame\}/ { printf "%s %03d\n", "% SLIDE ", slide 
                          print $0
                          slide = slide+1 }
$0 !~ /\\begin\{frame\}/ { print $0 }
