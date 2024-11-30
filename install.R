install.packages('Seurat', dependencies=TRUE)

# Install BiocManager to manage Bioconductor packages
install.packages("BiocManager")

# Install CRAN packages
install.packages("ggplot2")
install.packages("dplyr")

# Install Bioconductor packages
BiocManager::install("ArchR")

# Optional: Install GitHub packages
remotes::install_github("GreenleafLab/ArchR")
