# ChipSeq_Analysis_BF528
Project Completed as part of coursework for BF528 taught by Dr. Joey Orofino

# Project Description

BF528 Final project Anna McNiff. The goal of this project is to reproduce specific findings of Barutcu et al in "RUNX1 contributes to higher-order chromatin organization and gene regulation in breast cancer cells." Only specific parts of the analysis pipeline outlined below are reproduced here. 

### Skills: 
- Hands-on experience with a modern ChIPseq analysis pipeline
- Experience submitting jobs in a HPC environment
- Working proficiency with commonly used bioinformatics software tools including bowtie2, HOMER, deeptools, IGV and bedtools

# Contributors

Anna McNiff


# Repository Contents

## Analysis.sh 
Bash file for Analysis portion of Project 3 
- Converts BAM files to bigwig format 
- Creates a heatmap showing the clustered correlation values for input and IP samples akin to Supplemental Figure 2b.
- Generates Two plots (one for each IP replicate) showing the signal coverage for Runx1 across hg19 genes using the TSS and TTS as reference points

## Biologist.Rmd 
R markdown file for Biologist portion of Project 3 
- Filters and prunes DESeq2 results downloaded from GEO 
- Identifies up-regulated and down-regulated genes
- Identifies Bound and Unbound genes 
- Imports, transforms and plots HI-C data as a Heatmap
