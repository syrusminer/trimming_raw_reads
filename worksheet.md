# Trimming Raw Reads Worksheet

<!--- Write name below --->
## Name: Syrus Miner 

<!--- For this worksheet, answer the following questions--->

## Q1: What does "cleaning" your reads mean?
Answer: Cleaning your reads really just means modifying your reads to fit your desired criteria of what you want to keep.

### Q2: Open the script called "trim_raw_reads.sh". For every line that says ```insert description here```, replace that text with a description of what the line will do

while read i; do 
  	fastqc "$i"_1.fastq.gz # This command runs fastqc on the first end of the read to assess quality
  	fastqc "$i"_2.fastq.gz # Similar to the first, but on the other side of the read
done<../sra_files/sra_list
multiqc . # This one combines the results of multiple fastqc results into one report

# Specify the paths to the input Fastq files to be processed by fastp
# -m: Indicates the read to be merged, --merged_out: Specify your output file, --out1, and --out2: Specify output files of unmerged reads
# -e: Quality filtering threshold, Maximum error rate allowed and -q: Quality score threshold
# -u: Minimum length to be kept after trimming and -l: Maximum length to be kept after trimming
# --adapter_sequence  --adapter_sequence_r2: Tells what sequence to be trimmed for 1 and 2 (each side)
# -M: Maximum number of consecutive low-quality bases, -W:Sliding window (I think based off of your monitor), -5: 5' end for read quality trimming, and -3: 3' end for read quality
# -c: 1 enables trimming, 0 disables trimming


### Q4: Attach an image of the plot from fastqc showing the average base quality from your reads files
![remix1](./uufs/chpc.utah.edu/common/home/u1207142/Biol4310/Classwork/trimming_raw_reads/images/remix1.png)
![remix2](./uufs/chpc.utah.edu/common/home/u1207142/Biol4310/Classwork/trimming_raw_reads/images/remix2.png)
![before](./uufs/chpc.utah.edu/common/home/u1207142/Biol4310/Classwork/trimming_raw_reads/images/'Before trimming.png)

---

## The following questions pertain to your first fastp run (without altering the parameters)
### Q5: How many reads were there in the R1 file before filtering?
Answer: 33,967,298
### Q6: How many bases were there in the R1 file before filtering?
Answer: 3,430,697,098
### Q7: What proportion of bases were above PHRED score of 20 before filtering?
Answer: 96.2516%
### Q8: What proportion of bases were above PHRED score of 30 before filtering?
Answer: 91.5904%

### Q13: How many reads were there in the R2 file before filtering?
Answer: 33,967,298
### Q14: How many bases were there in the R2 file before filtering?
Answer: 3,430,697,098
### Q15: What proportion of bases were above PHRED score of 20 before filtering?
Answer: 95.005%
### Q16: What proportion of bases were above PHRED score of 30 before filtering?
Answer: 90.0214%

### Q17: How many reads were there in the merged file after filtering?
Answer: 12,295,196
### Q18: How many bases were there in the merged file after filtering?
Answer: 1,750,796,378
### Q19: What proportion of bases in the merged file were above PHRED score of 20 after filtering?
Answer:  98.9275%
### Q20: What proportion of bases in the merged file were above PHRED score of 30 after filtering?
Answer:  95.3968%

### Q21: What is the difference between the merged and unmerged files (in principle, not quantitatively)?
Answer: merged files contain information from multiple sources that give you a single longer read. Unmerged
files typically contain the raw, unprocessed reads obtained from the initial sequencing.
### Q22: Why are the unmerged files for R1 and R2 different lengths?
Answer: This could probably come from a range of factors. This could come from variations in sequencing
depth and or coverage, experimental errors, or even just biological variation.

---

## The following questions pertain to Remix 1 (the first time you change fastp parameters)
### Q23: What parameters did you change?
Answer: -e to 5 from 25
### Q24: How did you expect this to change the filtering results (be specific)?
Answer: I thought that this would allow the quality threshold to allow a lot more reads to go through. I thought
that the quality would go down by changing this flag.
### Q25: Explain the results. Did the change cause an effect that matched your expectations? Use information from the fastp output to explain.
Answer: I was suprised to see that the results did not change much. From the merged and filtered the PHRED scores above 30 changed from 95.3968% to 95.3848%, I was expecting a much larger change to happen from this. From first glance I didn't think that it had even changed.

---

## The following questions pertain to Remix 2 (the first time you change fastp parameters)
### Q26: What parameters did you change?
Answer: -M from 20 to 3
### Q27: How did you expect this to change the filtering results (be specific)?
Answer: Due to remix 1 not having large changes I wanted to see something big happen, I figured by changing the average minimum of bases in
the sliding window would allow a lot more low quality reads into the merge. I thought this would make the Q30 percent go down significantly compared
to the remix 1.
### Q28: Explain the results. Did the change cause an effect that matched your expectations? Use information from the fastp output to explain.
Answer: Again the change was still small, but it was larger than remix one. This time it went down to 95.2774% which is still not as much of a change as I would have expected to happen. It seems as though messing up on just one flag does not make that much of a difference to the overall quality of the
reads.

