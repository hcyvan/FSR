for ssr in `cat ssr.txt`;do
    #time bedtools genomecov  -strand -scale -d -ibam ./bam/${ssr}.bam > ./bedgraph/${ssr}.bedgraph
    #time bedtools genomecov  -strand + -d -ibam ./bam/${ssr}.bam > ./bedgraph/${ssr}.1.bedgraph
    #time bedtools genomecov  -strand - -d -ibam ./bam/${ssr}.bam > ./bedgraph/${ssr}.2.bedgraph
    time bedtools genomecov  -strand + -bga -ibam ./bam/${ssr}.bam > ./bedgraph/${ssr}.1.bedgraph
    time bedtools genomecov  -strand - -bga -ibam ./bam/${ssr}.bam > ./bedgraph/${ssr}.2.bedgraph
done
