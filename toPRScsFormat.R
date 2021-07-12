#!/usr/bin/env Rscript

###################################################################
####QC and re-format GWAS sumstats for PRScs                   ####
####Ying Wang (yiwang@broadinstitute.org) in June-2021         ####
###################################################################

########load packages needed########
library(data.table)
library(optparse) #for parsing arguments

#########parsing argument options########
option_list <- list(
  make_option(c("--sumstats"), type = "character", default = NULL, help = "Full path to your GWAS sumstats"),
  make_option(c("--headers"), type = "character", default = NULL, help = "The column names for (SNP,A1,A2,BETA,P) in your GWAS sumstats in the exactly same order, separated by comma.")
)

opt = parse_args(OptionParser(option_list=option_list))
sumstats <- opt$sumstats
headers <- opt$headers
headers1 <- strsplit(headers, ",")[[1]]

als <- c("A", "T", "G" ,"C")

gwas <- fread(sumstats)
gwas1 <- gwas[is_diff_AF_gnomAD == "no" & is_strand_flip == "no"][,..headers1]
names(gwas1) <- c("SNP", "A1", "A2", "BETA", "P")
gwas2 <- gwas1[A1 %in% als & A2 %in% als][grep("rs", SNP)]

if(grepl(".gz", sumstats)){
  outf <- gsub(".txt.gz", "", sumstats)
  fwrite(gwas2, file = paste0(outf,"_toPRScs.txt"), sep = "\t")
} else{
  outf <- gsub(".txt", "", sumstats)
  fwrite(gwas2, file = paste0(outf,"_toPRScs.txt"), sep = "\t")
}

