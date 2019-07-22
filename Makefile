# Makefile for task translating 17th century Dutch to modern Dutch
# See: http://ifarm.nl/clin2017
# 20160826 erikt(at)xs4all.nl

TRAINSIZE=32235 # number of lines in training files

all: 1637/bible.txt 1888/bible.txt
	# tokenize the texts: separate words from punctuation signs
	# bin/tokenize may be replaced by bin/tokenize.recode
	bin/tokenize < 1637/bible.txt > all.1637.tok
	bin/tokenize < 1888/bible.txt > all.1888.tok
	# divide texts in two parts: train and test
	head -$(TRAINSIZE) all.1637.tok > train.1637.tok
	head -$(TRAINSIZE) all.1888.tok > train.1888.tok
	tail -n +$(TRAINSIZE) all.1637.tok | sed '1d' > test.1637.tok
	tail -n +$(TRAINSIZE) all.1888.tok | sed '1d' > test.1888.tok
	# extract a translation lexicon from the two train parts
	bin/kvec94 train.1637.tok train.1888.tok > kvec94.out
	bin/chooseLexiconWords < kvec94.out > lexicon.txt
	# translate 1637 test text to 1888 Dutch with the lexicon
	bin/translate -l lexicon.txt < test.1637.tok > test.1637.translated.tok
	# compare the translated 1637 test text with the 1888 test text
	bin/bleu test.1637.translated.tok test.1888.tok
	# note: the baseline score is 0.13464
	# the translated text should obtain a higher score

# download the 1637 bible text
1637/bible.txt:
	cd 1637; make; cd ..

# download the 1888 bible text
1888/bible.txt:
	cd 1888; make; cd ..

# download the 2010 bible text (apocrypha are unavailable)
2010/bible.txt:
	cd 2010; make; cd ..

