# CLIN2017 Shared Task: Translating Historical Text
[![DOI](https://zenodo.org/badge/74691780.svg)](https://zenodo.org/badge/latestdoi/74691780)

Also see: http://ifarm.nl/clin2017st/

20160830 erikt(at)xs4all.nl

version date: 20190722a

This directory contains scripts which can be used for starting with the CLIN2017 Shared Task: Translating Historical Text.

## INSTRUCTIONS

The scripts require the programs curl and make.

1. download the zipfile from http://ifarm.nl/clin2017st/clin2017st.zip
2. unpack the zipfile: unzip clin2017st.zip
3. change directory to the shared task directory: cd clin2017st
4. run the program make: make

Step 4 takes about one hour. It downloads the relevant corpus files 
and performs an initial test. Note that the bible texts 
are not free of rights. You are not supposed to share them with others. 

This software has been tested on Mac OS X and Ubuntu Linux.

Report problems to erikt(at)xs4all.nl

## WHAT SHOULD YOU DO NEXT?

The software translates a test file of the final 5000 lines from 
the 1637 Statenvertaling bible to a version of Dutch of 1888 using 
a translation lexicon derived from the other parts of the bible. 
In order to test the quality of the translation, the translated
text is compared to the equivalent part of the 1888 bible with 
the Bleu measure (Papeneni et al, 2002):

```
$ bin/bleu test.1637.tok test.1888.tok 
processed 5000 sentences; bleu score = 0.13464
$ bin/bleu test.1637.translated.txt test.1888.tok 
processed 5000 sentences; bleu score = 0.50818
```

Originally, the similarity between the 1637 text and the 1888 text
was 0.13464 but after translation this improves to 0.50818 (the 
maximum attainable score is 1.00000). 

Your task is to change the translation system or build your own
system which can translate the 1637 test text in such a way that
when compared with the 1888 version the Blue score of the 
translated text improves beyond the current 0.50818.

Some suggestions to achieve this:

1. Find a method for using more of the training data for 
   extracting the lexicon: currently only about a third is used 
   (the corresponding sentences which have the same number of 
   words in both bibles).
1. Find and use word-internal character replacement rules, for
   example "ae" may be translated to "aa", see Tjong Kim Sang 
   (2016), section 3.4.
1. Use other sources for lexicon words, like INL's Lexicon
   Service: http://sk.taalbanknederlands.inl.nl/LexiconService/
1. Use other methods and your own ideas.

## NOTES ABOUT THE 2010 BIBLE

There is also a 2010 version of the Statenvertaling which you
can obtain by running:

```
$ cd 2010
$ make
```

(the text will be stored in the file 2010/bible.txt) However, 
the translation of the original 1637 text to the 2010 is done 
more freely than in the 1888 translation, which is why it is 
not the default choice here. It is more difficult to extract 
useful information from this 2010 version than from the 1888 
version. But you are free to try using the text. 

Note however that the apocrypha are missing in the 2010 bible
version, so if you want to work with this version you should 
restrict the 1637 data to the first 31175 lines.

# NOTES ABOUT THE 1657 BIBLE

A 1657 version of the Statenvertaling has been added to the 
data at 24 November 2016. You can obtain this version in the
same way as the 2010 version:

```
$ cd 1657
$ make
```

(the text will be stored in the file 1657/bible.txt).

The 1657 bible is slightly different from the 1637 bible. You 
can use it as additional training material in combination with
one of the two later bible versions.

# REFERENCES

Kishore Papineni and Salim Roukos and Todd Ward and Wei-Jing Zhu,
BLEU: a method for Automatic Evaluation of Machine Translation. 
In: Proceedings of ACL 2002. Association for Computational 
Linguistics, Philadelphia PA, 2002, pp. 311-318.

Erik Tjong Kim Sang, Improving Part-of-Speech Tagging of 
Historical Text by First Translating to Modern Text. In: 2nd IFIP 
International Workshop on Computational History and Data-Driven 
Humanities, editors: Bozic, Mendel-Gleason, Debruyne and 
O'Sullivan, Springer Verlag, 2016.

Erik Tjong Kim Sang, Marcel Bollmann, Remko Boschker, Francisco 
Casacuberta, Feike Dietz, Stefanie Dipper, Miguel Domingo, Rob 
van der Goot, Marjo van Koppen, Nikola Ljubešić, Robert Östling, 
Florian Petran, Eva Pettersson, Yves Scherrer, Marijn Schraagen, 
Leen Sevens, Jörg Tiedemann, Tom Vanallemeersch and Kalliopi 
Zervanou, The CLIN27 Shared Task: Translating Historical Text to 
Contemporary Language for Improving Automatic Linguistic 
Annotation. In: Computational Linguistics in the Netherlands 
Journal, volume 7, pages 53-64, 2017, ISSN 2211-4009
([PDF](http://clinjournal.org/sites/clinjournal.org/files/04.clin27-shared-task.pdf), 
[bibtex](http://clinjournal.org/biblio/export/bibtex/88))
