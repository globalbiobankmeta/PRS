pop=""
pheno=""
phenofile=""
popfile=""
prsfile=""
covs="" separated by comma
covfile=""
pc_numbers="PC1,PC2,PC3,PC4,PC5,PC6,PC7,PC8,PC9,PC10" ##default is 10PCs, changed based on specific biobank if needed
pcfile=""
n_tiles=10 ## default is 10
cohort_name=""
ldref=""
outf=""

Rscript create_prs_metrics_OR.R \
--pop ${pop} --pheno ${pheno} \
--phenofile ${phenofile} \
--popfile ${popfile} \
--prsfile ${prsfile} \
--covs ${covs} --covfile ${covfile} \
--pc_numbers ${pc_numbers} --pcfile ${pcfile} \
--n_tiles $n_tiles \
--cohort_name ${cohort_name} \
--ldref ${ldref} \
--outf ${outf}
