20170211 gold standard data associated with the CLIN2017 shared task
contact person: Erik Tjong Kim Sang erikt(at)xs4all.nl

There are 10 gold standard translated files:

1607-hooft-text-translated.txt
1616-bredero-text-translated.txt
1626-beeckman-text-translated.txt
1636-degroot-text-translated.txt
1646-frederik-text-translated.txt
1656-vanriebeek-text-translated.txt
1668-hamel-text-translated.txt
1678-leeuwenhoek-text-translated.txt
1686-bidloo-text-translated.txt
1692-huygens-text-translated.txt

The files are tokenized and contain one sentence per line.
One-to-many token alignments are indicated by having an
underscore between the words rather than a space, for
example "van_de". Many-to-one token alignments are indicated
by having a plus sign between the words rather than a space,
for example "na+dien". Deleted tokens have been replaced
with the token "DELETED". These special notations are
required for alignment purposes and should be removed before
further processing and evaluation.

There are two more files:

1616-bredero-parallel-goldpos.txt
   The golden standard POS tags for the 1616 file. It
   contains one token per line followed by a space and the
   gold standard base POS tag. Sentences are separated by 
   empty lines.
 
1616-bredero-text-translated-tagged.txt
   The gold standard translation for the 1616 file with the
   tags assigned to the tokens by the Mbt tagger (part of
   the Frog tool for Dutch syntactic annotation). It
   contains one sentence per line with the end-of-sentence
   marker "<utt>" at the end of each line. Each token is
   followed by one (known token) or two (unknown token)
   slashes and its estimated POS tag.

