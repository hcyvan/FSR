#!/usr/bin/env bash 
BAM=bam
BAM_MERGED=bam_merged
BEDGRAPH=bedgraph

merge() {
    samtools merge -@8 "$BAM_MERGED/1218.0.bam" "$BAM/1218011.bam" "$BAM/1218021.bam" "$BAM/1218-0.bam"
    samtools merge -@8 "$BAM_MERGED/1218.05.bam" "$BAM/12180511.bam" "$BAM/12180521.bam" "$BAM/1218-0-5.bam"
    samtools merge -@8 "$BAM_MERGED/1218.4.bam" "$BAM/121841.bam" "$BAM/121842.bam" "$BAM/1218-4.bam"
    samtools merge -@8 "$BAM_MERGED/1218.12.bam" "$BAM/1218121.bam" "$BAM/1218122.bam" "$BAM/1218-12.bam"
    samtools merge -@8 "$BAM_MERGED/1218.24.bam" "$BAM/1218241.bam" "$BAM/1218242.bam" "$BAM/1218-24.bam"
    samtools merge -@8 "$BAM_MERGED/1218.48.bam" "$BAM/1218481.bam" "$BAM/1218482.bam" "$BAM/1218-48.bam"
}

bam2bedgraph() {
    time bedtools genomecov  -strand + -bga -ibam "./$BAM_MERGED/1218.0.bam" > "./$BEDGRAPH/1218.0.1.bedgraph"
    time bedtools genomecov  -strand - -bga -ibam "./$BAM_MERGED/1218.0.bam" > "./$BEDGRAPH/1218.0.2.bedgraph"
    time bedtools genomecov  -strand + -bga -ibam "./$BAM_MERGED/1218.05.bam" > "./$BEDGRAPH/1218.05.1.bedgraph"
    time bedtools genomecov  -strand - -bga -ibam "./$BAM_MERGED/1218.05.bam" > "./$BEDGRAPH/1218.05.2.bedgraph"
    time bedtools genomecov  -strand + -bga -ibam "./$BAM_MERGED/1218.4.bam" > "./$BEDGRAPH/1218.4.1.bedgraph"
    time bedtools genomecov  -strand - -bga -ibam "./$BAM_MERGED/1218.4.bam" > "./$BEDGRAPH/1218.4.2.bedgraph"
    time bedtools genomecov  -strand + -bga -ibam "./$BAM_MERGED/1218.12.bam" > "./$BEDGRAPH/1218.12.1.bedgraph"
    time bedtools genomecov  -strand - -bga -ibam "./$BAM_MERGED/1218.12.bam" > "./$BEDGRAPH/1218.12.2.bedgraph"
    time bedtools genomecov  -strand + -bga -ibam "./$BAM_MERGED/1218.24.bam" > "./$BEDGRAPH/1218.24.1.bedgraph"
    time bedtools genomecov  -strand - -bga -ibam "./$BAM_MERGED/1218.24.bam" > "./$BEDGRAPH/1218.24.2.bedgraph"
    time bedtools genomecov  -strand + -bga -ibam "./$BAM_MERGED/1218.48.bam" > "./$BEDGRAPH/1218.48.1.bedgraph"
    time bedtools genomecov  -strand - -bga -ibam "./$BAM_MERGED/1218.48.bam" > "./$BEDGRAPH/1218.48.2.bedgraph"
}

bam2wig() {
    #samtools depth bam_merged_split/1218.0.f.bam |awk '{print $2,$3}' > wig/1218.0.f.wig
    samtools depth bam_merged_split/1218.0.r.bam |awk '{print $2,$3}' > wig/1218.0.r.wig
    samtools depth bam_merged_split/1218.05.f.bam |awk '{print $2,$3}' > wig/1218.05.f.wig
    samtools depth bam_merged_split/1218.05.r.bam |awk '{print $2,$3}' > wig/1218.05.r.wig
    samtools depth bam_merged_split/1218.4.f.bam |awk '{print $2,$3}' > wig/1218.4.f.wig
    samtools depth bam_merged_split/1218.4.r.bam |awk '{print $2,$3}' > wig/1218.4.r.wig
    samtools depth bam_merged_split/1218.12.f.bam |awk '{print $2,$3}' > wig/1218.12.f.wig
    samtools depth bam_merged_split/1218.12.r.bam |awk '{print $2,$3}' > wig/1218.12.r.wig
    samtools depth bam_merged_split/1218.24.f.bam |awk '{print $2,$3}' > wig/1218.24.f.wig
    samtools depth bam_merged_split/1218.24.r.bam |awk '{print $2,$3}' > wig/1218.24.r.wig
    samtools depth bam_merged_split/1218.48.f.bam |awk '{print $2,$3}' > wig/1218.48.f.wig
    samtools depth bam_merged_split/1218.48.r.bam |awk '{print $2,$3}' > wig/1218.48.r.wig

}

bam_split(){
	samtools view -F 0x10 bam_merged/1218.0.bam -bh -o bam_merged_split/1218.0.f.bam
	samtools view -f 0x10 bam_merged/1218.0.bam -bh -o bam_merged_split/1218.0.r.bam
	samtools view -F 0x10 bam_merged/1218.05.bam -bh -o bam_merged_split/1218.05.f.bam
	samtools view -f 0x10 bam_merged/1218.05.bam -bh -o bam_merged_split/1218.05.r.bam
	samtools view -F 0x10 bam_merged/1218.4.bam -bh -o bam_merged_split/1218.4.f.bam
	samtools view -f 0x10 bam_merged/1218.4.bam -bh -o bam_merged_split/1218.4.r.bam
	samtools view -F 0x10 bam_merged/1218.12.bam -bh -o bam_merged_split/1218.12.f.bam
	samtools view -f 0x10 bam_merged/1218.12.bam -bh -o bam_merged_split/1218.12.r.bam
	samtools view -F 0x10 bam_merged/1218.24.bam -bh -o bam_merged_split/1218.24.f.bam
	samtools view -f 0x10 bam_merged/1218.24.bam -bh -o bam_merged_split/1218.24.r.bam
	samtools view -F 0x10 bam_merged/1218.48.bam -bh -o bam_merged_split/1218.48.f.bam
	samtools view -f 0x10 bam_merged/1218.48.bam -bh -o bam_merged_split/1218.48.r.bam
}

# merge
# bam2bedgraph
# ./srna.py find -g ./genome/GCF_000018345.1_ASM1834v1_genomic.gff -i ./bedgraph -o ./bed -b ./bedgraph.find.txt -c 10
# ./srna.py merge -i ./bed -f 1218.0.bed -f 1218.05.bed -f 1218.4.bed  -f 1218.12.bed -f 1218.24.bed -f 1218.48.bed > srna.gff
# ./srna.py merge2anno -f ./srna.gff -a ./genome/GCF_000018345.1_ASM1834v1_genomic.gff |grep SRNA > srna.nctype.gff
# samtools depth -r chr12:126073855-126073965  Ip.sorted.bam

bam2wig
