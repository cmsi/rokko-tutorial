BASENAME = master
SRC = ${BASENAME}-in.tex style/*.sty style/*.bb

default: ${BASENAME}-wide.pdf ${BASENAME}.pdf

${BASENAME}-wide.dvi: ${BASENAME}-wide.tex ${SRC}
	TEXINPUTS=.:./style//: platex -shell-escape ${BASENAME}-wide.tex
	TEXINPUTS=.:./style//: platex ${BASENAME}-wide.tex
	TEXINPUTS=.:./style//: platex ${BASENAME}-wide.tex

${BASENAME}-wide.pdf: ${BASENAME}-wide.dvi
	TEXINPUTS=.:./style//: dvipdfmx ${BASENAME}-wide.dvi

${BASENAME}.dvi: ${BASENAME}.tex ${SRC}
	TEXINPUTS=.:./style//: platex -shell-escape ${BASENAME}.tex
	TEXINPUTS=.:./style//: platex ${BASENAME}.tex
	TEXINPUTS=.:./style//: platex ${BASENAME}.tex

${BASENAME}.pdf: ${BASENAME}.dvi
	TEXINPUTS=.:./style//: dvipdfmx ${BASENAME}.dvi

clean:
	rm -f ${BASENAME}*.aux ${BASENAME}*.dvi ${BASENAME}*.log ${BASENAME}*.nav ${BASENAME}*.out ${BASENAME}*.snm ${BASENAME}*.toc ${BASENAME}*.vrb
	rm -rf auto *.xbb ./style/*.xbb

distclean: clean
	rm -f ${BASENAME}-wide.pdf ${BASENAME}.pdf
