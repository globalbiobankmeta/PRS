PATH_TO_REFERENCE=""
VALIDATION_BIM_PREFIX=""
GWAS_SAMPLE_SIZE1=
GWAS_SAMPLE_SIZE2=
GWAS_SAMPLE_SIZE3=
SUM_STATS_FILE1=""
SUM_STATS_FILE2=""
SUM_STATS_FILE3=""
OUTPUT_DIR=""
N_THREADS=""
PATH_TO_PRSCS_DIR=""

chrom=${TASK_ID}

export MKL_NUM_THREADS=$N_THREADS
export NUMEXPR_NUM_THREADS=$N_THREADS
export OMP_NUM_THREADS=$N_THREADS

python3 $PATH_TO_PRSCS_DIR/PRScs.py --ref_dir=$PATH_TO_REFERENCE \
--bim_prefix=$VALIDATION_BIM_PREFIX --chrom=$chrom \
--sst_file=$SUM_STATS_FILE1,$SUM_STATS_FILE2,$SUM_STATS_FILE3 --n_gwas=$GWAS_SAMPLE_SIZE1,$GWAS_SAMPLE_SIZE2,$GWAS_SAMPLE_SIZE3 \
--out_dir=$OUTPUT_DIR 
