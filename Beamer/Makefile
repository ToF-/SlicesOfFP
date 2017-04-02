SlicesOfFp : SlicesOfFP.tex
	pdflatex SlicesOfFP.tex

number : SlicesOfFP.tex
	./number.awk <SlicesOfFP.tex >temp; rm SlicesOfFP.tex; mv temp SlicesOfFP.tex
