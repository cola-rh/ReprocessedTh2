setwd("/omics/groups/OE0246/internal/guz/cola_hc/examples/ReprocessedTh2")
library(cola)
library(scRNAseq)
data = readRDS('/omics/groups/OE0246/internal/guz/cola_hc/examples/ReprocessedTh2/ReprocessedTh2_data.rds')
mat = assays(data)$rsem_tpm
mat = log2(mat + 1)
mat = adjust_matrix(mat)

anno = colData(data)[, c("NREADS")]
anno = as.data.frame(anno)

rh = hierarchical_partition(mat, subset = 500, cores = 4, anno = anno)
saveRDS(rh, file = "ReprocessedTh2_cola_rh.rds")


cola_report(rh, output = "ReprocessedTh2_cola_rh_report", title = "cola Report for Hierarchical Partitioning - 'ReprocessedTh2'")
