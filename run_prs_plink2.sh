bfile=""
scorefile=""
outdir=""

plink2 --bfile ${bfile} \
--score ${scorefile}  2 4 6 cols=+scoresums \
--out ${outdir} 

