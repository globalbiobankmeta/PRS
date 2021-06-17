######demo example
wkdir="/scratch/90days/uqywan67/"
cd ${wkdir}
sumstats="Asthma_Bothsex_leave_UKBB_inv_var_meta_GBMI_052021"
Pop="EUR"
PHENO="ASTHMA"
covs="AgeAttend,Sex"
K="0.058"

Rscript gbmi/scripts/cal_prs_metrics.R \
--pop ${Pop} --pheno ${PHENO} \
--covs ${covs} \
--K $K \
--phenofile PRScs/phenotypes/ukb2_diseases23.phen \
--popfile PRScs/grm/UKB_British1-new_rel05.grm.id  \
--prsfile gbmi/clump/profiles/res_clumped/${sumstats}_clumpHM3_ld0.5_win500_ref500.S9.profile \
--covfile PRScs/phenotypes/ukb2_diseases23.phen \
--pcfile PRScs/phenotypes/1000G.ukb_proj.proj.eigenvec \
--out gbmi/outputs/${sumstats}_${Pop}_summary.txt 
