library(Seurat)
library(SeuratData)
library(SeuratWrappers)
library(Azimuth)
library(ggplot2)
library(patchwork)
options(future.globals.maxSize = 1e9)

# InstallData("pbmcsca")
# SeuratData::UpdateData('pbmcsca')

# load in the pbmc systematic comparative analysis dataset
obj <- LoadData("pbmcsca")
obj <- subset(obj, nFeature_RNA > 1000)
obj <- RunAzimuth(obj, reference = "pbmcref")

# currently, the object has two layers in the RNA assay: counts, and data
obj

# split
obj[["RNA"]] <- split(obj[["RNA"]], f = obj$Method)
obj
