###############
# Anna McNiff #
#    Final    #
#  Analysis   #
###############

module unload anaconda3
module load python3/3.8.6
module load deeptools/3.5.1
module load samtools

#Load the required modules: DeepTools

#Use the bamCoverage utility in DeepTools to generate a bigwig file 
#for each sorted BAM file you received from the data curator.
# Generate a bigWig file for each of the 4 BAM files provided.
# big wig files in ../sample
export SAMPLEDIR=/projectnb/bf528/users/group_6/project_3/sample

#bamCoverage --bam $SAMPLEDIR/inp_rep1_sorted.bam -o inp_rep1.bw \
#    --normalizeUsing CPM
#    --binSize 10
#    --extendReads
#USING THREHOLDS RECCOMENDED FROM DOCS FOR CHIP-SEQ
#bamCoverage --bam $SAMPLEDIR/inp_rep2_sorted.bam -o inp_rep2.bw \
#    --normalizeUsing CPM
#    --binSize 10
#    --extendReads
#bamCoverage --bam $SAMPLEDIR/runx1_rep2_sorted.bam -o runx1_rep2.bw \
#    --normalizeUsing CPM
#    --binSize 10
#    --extendReads

#get error that runx1_rep1_sorted.bam file isn't indexed 
#samtools index sample.sorted.bam
#samtools index $SAMPLEDIR/runx1_rep1_sorted.bam

#bamCoverage --bam $SAMPLEDIR/runx1_rep1_sorted.bam -o runx1_rep1.bw \
#    --normalizeUsing CPM
#    --binSize 10
#    --extendReads
    




# Once you have produced all of the bigwig files, use the
# multiBigWigSummary utility and the plotCorrelation utility
# to produce a clustered heatmap of the Pearson correlation
# values between all the samples. 

# multiBigWigSummary
#multiBigwigSummary bins -b inp_rep1.bw inp_rep2.bw runx1_rep1.bw runx1_rep2.bw -o multiBigWigSummary.npz -p 16

# plotCorrelation
#plotCorrelation -in multiBigWigSummary.npz -o plotCorrelation.png --corMethod pearson --skipZeros --plotNumbers --whatToPlot heatmap --colorMap coolwarm --outFileCorMatrix plotCorrelation.txt --labels "INPUT Rep1" "INPUT Rep2" "RUNX1 Rep1" "RUNX1 Rep2"



# Using the bigwig files for the IP samples generated in step 1 
# and the BED file of hg19 genes from step 3, run the computeMatrix 
# utility in DeepTools in the scale-regions mode twice (once for each IP sample).


# computeMatrix
computeMatrix scale-regions -S inp_rep1.bw -R hg19_genes.bed -o inp_rep1_matrix.gz -b 2000 -a 2000 -p 16 -m 6000
computeMatrix scale-regions -S inp_rep2.bw -R hg19_genes.bed -o inp_rep2_matrix.gz -b 2000 -a 2000 -p 16 -m 6000

#computeMatrix scale-regions -S runx1_rep1.bw -R hg19_genes.bed -o runx1_rep1_matrix.gz -b 2000 -a 2000 -p 16 -m 6000
#computeMatrix scale-regions -S runx1_rep2.bw -R hg19_genes.bed -o runx1_rep2_matrix.gz -b 2000 -a 2000 -p 16 -m 6000

#You will have run computeMatrix twice (on both replicates) and generated
# two matrices of values
#Run plotProfile on each matrix to generate a visualization of the Runx1 
# signal coverage across hg19 genes.

# plotProfile
#plotProfile -m runx1_rep1_matrix.gz -o runx1_rep1_profile.png --endLabel TTS -y "CPM normalized ChIP-seq Signal" --dpi 500
#plotProfile -m runx1_rep2_matrix.gz -o runx1_rep2_profile.png --endLabel TTS -y "CPM normalized ChIP-seq Signal" --dpi 500

plotProfile -m inp_rep1_matrix.gz -o inp_rep1_profile.png --endLabel TTS -y "CPM normalized ChIP-seq Signal" --dpi 500
plotProfile -m inp_rep2_matrix.gz -o inp_rep2_profile.png --endLabel TTS -y "CPM normalized ChIP-seq Signal" --dpi 500
