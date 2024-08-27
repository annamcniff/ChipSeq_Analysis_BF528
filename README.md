# ChipSeq_Analysis_BF528
Project Completed as part of coursework for BF528 taught by Dr. Joey Orofino

## Project Description

BF528 Final project Anna McNiff

## Contributors

Anna McNiff

# Repository Contents

## Analysis.sh 
Bash file for Analysis portion of Project 3 
- Converts BAM files to bigwig format 
- Creates A heatmap showing the clustered correlation values for input and IP samples akin to Figure Supp2b.
- Generates Two plots (one for each IP replicate) showing the signal coverage for Runx1 across hg19 genes using the TSS and TTS as reference points

## Biologist.Rmd 
R markdown file for Biologist portion of Project 3 
- Filters and prunes DESeq2 results downloaded from GEO 
- Identifies up-regulated and down-regulated genes
- Identifies Bound and Unbound genes 
- Imports, transforms and plots HI-C data as a Heatmap
