#./srna.py  scale -ii ./bedgraph/d -o ./bedgraph -f ./bedgraph.txt
./srna.py find -g ./genome/GCF_000195955.2_ASM19595v2_genomic.gff -i ./bedgraph -o ./bedgraph -b ./bedgraph.find.txt -c 10
./srna.py merge -f day0_o.bedgraph -f day1_o.bedgraph -f day2_o.bedgraph -i ./bedgraph -f day3_o.bedgraph -f day4_o.bedgraph > ./gff/srna.gff
./srna.py merge2anno -f ./gff/srna.gff -a ./gff/GCF_000195955.2_ASM19595v2_genomic.gff |grep SRNA > ./gff/srna.nctype.gff
./srna.py merge2anno -f ./gff/srna.gff -a ./gff/GCF_000195955.2_ASM19595v2_genomic.gff > all.nctype.gff
