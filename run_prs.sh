bfile=""
scorefile=""
outdir=""

plink --bfile ${bfile} \
--score ${scorefile}  2 4 6 sum \
--out ${outdir} 

