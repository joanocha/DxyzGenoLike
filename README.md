# DxyzGenoLike
Snakemake workflow to perform Linderoth's Dxyz method on Genotype Likelihoods


Go to https://github.com/tplinderoth/introDist.git if you are working on called Genotypes and want to read more about the Dxyz scan developed by Tyler Linderoth to look for adaptive introgression. 

Dependencies:
- PopGenomicTools (https://github.com/tplinderoth/PopGenomicsTools.git)
- Snakemake (https://github.com/snakemake/snakemake)


Configuration:

Edit `config.yaml`. You must specify: 

- The three input files to be used as x, y and z. These should be 3 ANGSD  MAF outputs (.maf.gz) files run with -doMajorMinor 4 option. Assumes snps are biallelic.  
- Specify the path to PopGenomicsTools
- Define window size and step size pairs. Size is defined as number of snps. 

Output:
1) chromosome
2) Window start
3) Window end
4) dxy
5) number of sites for dxy
6) dxz 
7) number of sites for dxz
8) dxyz

To run:
```
$ snakemake
```
