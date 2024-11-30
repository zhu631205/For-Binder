#1. Load library

library(Seurat)
library(tidyverse)

setwd("C:/Users/zhuzh/Documents/NGS/GSE132771_RAW")

#2.  Read barcodes, features (genes) and matrix files
NML_I<-  Read10X(data.dir = "C:/Users/zhuzh/Documents/NGS/GSE132771_RAW/NML1")
NML_I
view(NML_I)
head(NML_I)

#3. Create, view and save seurat object

#3.1 create Seurat projects
NML_I <- CreateSeuratObject(counts = NML_I, assay="RNA", project = "NML_I", min.cells=3, min.features=200)
class(NML_I)

##View Project
NML_I
colnames(NML_I)
rownames(NML_I)
view(NML_I)  #click NML_I in enviroment window will do the same
view(NML_I@meta.data)

#Standard processing workflow

#3.2. QC
###view QC metrics
range(NML_I$nFeature_RNA)
range(NML_I$nCount_RNA)

#3.3. Store mitochondrial percentage in object meta data

NML_I <-PercentageFeatureSet(NML_I,pattern = "^MT-", col.name="percent.mt")
view(NML_I@meta.data)
range(NML_I$percent.mt)

###selecting cells for further analysis

####visulize QC metrics as violin plot

VlnPlot(NML_I, features = c("nFeature_RNA", "nCount_RNA","percent.mt"), ncol=3)

NML_I

####remove low quality cells

NML_I <- subset(NML_I,subset = nFeature_RNA>500&nFeature_RNA<4000&nCount_RNA<20000&percent.mt<10)

#### view QC metrics again

VlnPlot(NML_I, features = c("nFeature_RNA", "nCount_RNA","percent.mt"), ncol=3)

NML_I

# 3.4. preprocessing


NML_I <-NormalizeData(NML_I, normalization.method = "LogNormalize", 
                      scale.factor = 10000)## Data normalization
NML_I <- FindVariableFeatures(NML_I,
                              selection.method = "vst", nfeatures = 2000)### Identification of highly variable features (feature selection)
VariableFeaturePlot(NML_I)# Top features and feature plot
NML_I <- ScaleData(NML_I)## Data scaling using 2000 identified variable features or all genes   
NML_I <-RunPCA(NML_I)# Perform PCA and uMAP
DimPlot(NML_I, reduction='pca', dims=c(1:2))## Examine and visualize PCA results
ElbowPlot(NML_I, ndim=50)## determine the dimensional of dataset
NML_I <- FindNeighbors(NML_I, dim=1:20)## Cluster the cells
NML_I <- FindClusters(NML_I, resolution =0.3)
NML_I <- RunUMAP(NML_I, dims=1:20)## run non-linear dimensional reduction (UMAP / TSNE)


DimPlot(NML_I, reduction="umap", label=T)
DimPlot(NML_I, reduction = "umap", label = TRUE, label.box = TRUE) 
FeaturePlot(NML_I, features="HMOX1", reduction = "umap")
FeaturePlot(NML_I, features = c("CD86", "TREM2"), blend = TRUE, reduction = "umap")
VlnPlot(NML_I, features=c("CD86", "TREM2"), group.by="seurat_clusters")
