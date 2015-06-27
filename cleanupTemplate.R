##############20150420 R script: EE template #################
source("http://bioconductor.org/biocLite.R")
biocLite("Biostrings")
library(Biostrings)

###Name strings. Note the beginning letter has to be a lowercase letter.####
plasma1pt352=readDNAStringSet(file='/Path/To/Fasta1.fasta',format='fasta')
plasma3pt355=readDNAStringSet(file='/Path/To/Fasta2.fasta',format='fasta')

####Make table########
plasma1pt352table=table(as.character(plasma1pt352))
plasma3pt355table=table(as.character(plasma3pt355))

######Drop <0.5% sequences##########
plasma1pt352tokeep=plasma1pt352table[plasma1pt352table>(sum(plasma1pt352table)*0.005)]
plasma3pt355tokeep=plasma3pt355table[plasma3pt355table>(sum(plasma3pt355table)*0.005)]

####Rename stringsets########
plasma1pt352=DNAStringSet(names(plasma1pt352tokeep))
plasma3pt355=DNAStringSet(names(plasma3pt355tokeep))

#####Indicate frequencies in each sequence########
names(plasma1pt352)=paste('plasma1pt352',make.unique(as.character(plasma1pt352tokeep)))
names(plasma3pt355)=paste('plasma3pt355',make.unique(as.character(plasma3pt355tokeep)))

#######Create a file with these summarized sequences. Note to locate the created file to desired folder######
writeXStringSet(c(plasma1pt352, plasma3pt355),file="/Path/To/Cleaned/Template/File",width=100)

####Note: to build a tree, open the above file by BioEdit. Run CLUSTALW. Save alignment. Open in MEGA.
