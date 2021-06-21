#!/bin/bash

################################################################################
# Please fill in the below variables
################################################################################
Pop="" #e.g., "EUR"
PHENO="" #e.g., "ASTHMA"
covs="" #e.g, "Age,Sex"
K=NULL #e.g., 0.058, if not specified, please keep it as NULL, the script will use the proportion of cases in the target population by default
phenofile="" 
popfile=""
prsfile=""
covfile=""
pcfile=""
out=""

Rscript --slave create_prs_metrics.R \
--pop ${Pop} --pheno ${PHENO} \
--covs ${covs} \
--K ${K} \
--phenofile ${phenofile} \
--popfile ${popfile}  \
--prsfile ${prsfile} \
--covfile $covfile \
--pcfile ${pcfile} \
--out ${out}
