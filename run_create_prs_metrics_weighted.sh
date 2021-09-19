#!/bin/bash

################################################################################
# Please fill in the below variables
################################################################################
Pop="" #e.g., "EUR"
PHENO="" #e.g., "ASTHMA"
prop="" #e.g., 0.1
reps="" #number of replications
covs="" #e.g, "Age,Sex"
pc_numbers="PC1,PC2,PC3,PC4,PC5,PC6,PC7,PC8,PC9,PC10" ##PC1:PC10 is used by default, please change based on your specific Biobank GWAS analyses.
K=NULL #e.g., 0.058, if not specified, please keep it as NULL, the script will use the proportion of cases in the target population by default
phenofile="" 
popfile=""
covfile=""
pcfile=""
cohort="" # Your specific Biobank name
ldref="" # LD reference panel used, e.g., 1KG or UKBB
files="" ##list of scorefile, separated by comma
out_weights="" ##output file name for weights metrics
wt="" ##variable for weights. NKr2 or h2l_NKr2
out_test_metrics="" ## output file name for final accuracy metrics in test cohort

Rscript --slave create_prs_metrics_weighted.R \
--pop ${Pop} --pheno ${PHENO} \
--covs ${covs} \
--prop ${prop} \
--reps ${reps} \
--K ${K} \
--pc_numbers ${pc_numbers} \
--phenofile ${phenofile} \
--popfile ${popfile}  \
--covfile $covfile \
--pcfile ${pcfile} \
--cohort_name ${cohort} \
--ldref ${ldref} \
--files ${files} --wt ${wt} \
--out_weights ${out_weights} \
--out_test_metrics ${out_test_metrics}
