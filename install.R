install.packages('Seurat', dependencies=TRUE)

# Install BiocManager to manage Bioconductor packages
install.packages("BiocManager")

# Install CRAN packages
install.packages("ggplot2")
install.packages("dplyr")

# install archr
if (!requireNamespace("devtools", quietly = TRUE)) install.packages("devtools")
if (!requireNamespace("BiocManager", quietly = TRUE)) install.packages("BiocManager")
devtools::install_github("GreenleafLab/ArchR", ref="master", repos = BiocManager::repositories())
library(ArchR)
ArchR::installExtraPackages()
