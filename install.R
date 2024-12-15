install.packages('Seurat', dependencies=TRUE)

# install.R

# Install devtools if not already installed
if (!requireNamespace("devtools", quietly = TRUE)) {
  install.packages("devtools")
}

# Install BiocManager
if (!requireNamespace("BiocManager", quietly = TRUE)) {
  install.packages("BiocManager")
}

# Install ArchR dependencies
BiocManager::install(c("grid", "data.table", "SummarizedExperiment"))

# Install ArchR
devtools::install_github("GreenleafLab/ArchR", ref = "master", dependencies = TRUE)

# Verify installation
library(ArchR)
print("ArchR has been installed successfully!")
