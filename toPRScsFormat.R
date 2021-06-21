#!/usr/bin/env Rscript

###################################################################
####calculate PRS accuracy metrics for disease traits          ####
####Ying Wang (yiwang@broadinstitute.org) in June-2021         ####
###################################################################

########load packages needed########
library(data.table)
library(optparse) #for parsing arguments

#########parsing argument options########
option_list <- list(
  make_option(c("--sumstats"), type = "character", default = NULL, help = "Full path to your GWAS sumstats"),
  make_option(c("--headers"), type = "character", default = NULL, help = "The names separated by comma for (SNP A1 A2 BETA/OR P) in your GWAS sumstats in the exactly same order")
)

opt = parse_args(OptionParser(option_list=option_list))
sumstats <- opt$sumstats
headers <- opt$headers
headers1 <- strsplit(headers, ",")[[1]]

als <- c("A", "T", "G" ,"C")

gwas <- fread(sumstats)
gwas1 <- gwas[,..headers1]
names(gwas1) <- c("SNP", "A1", "A2", "BETA", "P")
gwas1 <- gwas1[A1 %in% als & A2 %in% als]
fwrite(gwas1, file = paste0(sumstats,"_toPRScs"), sep = "\t")
