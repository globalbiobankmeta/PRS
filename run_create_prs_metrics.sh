#!/bin/bash

################################################################################
# Please fill in the below variables
################################################################################
Pop="" #e.g., "EUR"
PHENO="" #e.g., "ASTHMA"
covs="" #e.g, "Age,Sex"
pc_numbers="PC1,PC2,PC3,PC4,PC5,PC6,PC7,PC8,PC9,PC10" ##PC1:PC10 is used by default, please change based on your specific Biobank GWAS analyses.
K=NULL #e.g., 0.058, if not specified, please keep it as NULL, the script will use the proportion of cases in the target population by default
phenofile="" 
popfile=""
prsfile=""
covfile=""
pcfile=""
cohort="" # Your specific Biobank name
ldref="" # LD reference panel used, e.g., 1KG or UKBB
out=""

Rscript --slave create_prs_metrics.R \
--pop ${Pop} --pheno ${PHENO} \
--covs ${covs} \
--K ${K} \
--pc_numbers ${pc_numbers} \
--phenofile ${phenofile} \
--popfile ${popfile}  \
--prsfile ${prsfile} \
--covfile $covfile \
--pcfile ${pcfile} \
--cohort_name ${cohort} \
--ldref ${ldref} \
--out ${out}
