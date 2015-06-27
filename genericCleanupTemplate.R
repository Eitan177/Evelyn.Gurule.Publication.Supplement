############## R script: cleanup template #################
source("http://bioconductor.org/biocLite.R")
biocLite("Biostrings")
library(Biostrings)

###Name strings. Note the beginning letter has to be a lowercase letter.####
sequencegroup1=readDNAStringSet(file='/Path/To/Fasta1.fasta',format='fasta')
sequencegroup2=readDNAStringSet(file='/Path/To/Fasta2.fasta',format='fasta')

####Make table########
sequencegroup1table=table(as.character(sequencegroup1))
sequencegroup2table=table(as.character(sequencegroup2))

######Drop <0.5% sequences##########
sequencegroup1tokeep=sequencegroup1table[sequencegroup1table>(sum(sequencegroup1table)*0.005)]
sequencegroup2tokeep=sequencegroup2table[sequencegroup2table>(sum(sequencegroup2table)*0.005)]

####Rename stringsets########
sequencegroup1=DNAStringSet(names(sequencegroup1tokeep))
sequencegroup2=DNAStringSet(names(sequencegroup2tokeep))

#####Indicate frequencies in each sequence########
names(sequencegroup1)=paste('sequencegroup1',make.unique(as.character(sequencegroup1tokeep)))
names(sequencegroup2)=paste('sequencegroup2',make.unique(as.character(sequencegroup2tokeep)))

#######Create a file with these summarized sequences. Note to locate the created file to desired folder######
writeXStringSet(c(sequencegroup1, sequencegroup2),file="/Path/To/Cleaned/Template/File",width=100)

####Note: to build a tree, open the above file in BioEdit. Run CLUSTALW. Save alignment. Open in MEGA.