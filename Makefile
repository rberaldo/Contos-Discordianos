# Based on http://wikiri.upc.es/index.php/A_Makefile_to_compile_Latex
# by: Joenio Costa <joenio@perl.org.br>
#
############################### FILES ###############################
#
# DOC: the document

DOC = contos_discordianos

############################### PROGRAMS ###############################

TEX = pdflatex
RM = rm -f
MAKE = make 

########################################################################

$(DOC).pdf:
	$(TEX) $(DOC).tex
#	bibtex $(DOC).aux
	$(TEX) $(DOC).tex
	makeindex $(DOC).idx
	$(TEX) $(DOC).tex

clean:
	$(RM) $(DOC).aux $(DOC).log
	$(RM) $(DOC).toc $(DOC).lot $(DOC).lof
	$(RM) $(DOC).ttt $(DOC).lot $(DOC).fff
	$(RM) $(DOC).blg $(DOC).out
	$(RM) $(DOC).dvi $(DOC)-*.dvi
	$(RM) $(DOC).ps $(DOC)-*.ps
	$(RM) $(DOC).tex.backup
	$(RM) $(DOC).tex.bak
	$(RM) $(DOC).bbl
	$(RM) $(DOC).pdf
	$(RM) $(DOC).tex~
	$(RM) $(DOC).bib~
	$(RM) Makefile~
	$(RM) *.ind *.ilg *.idx *.aux
	$(RM) texput.log core

show:	$(DOC).pdf
	evince $(DOC).pdf

shownew:	clean	$(DOC).pdf
		evince $(DOC).pdf
