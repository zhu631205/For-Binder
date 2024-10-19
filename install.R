# Install devtools if it's not installed (to install Seurat from GitHub)
if (!requireNamespace("devtools", quietly = TRUE)) {
  install.packages("devtools")
}

# Install Seurat version 5 from GitHub using devtools
devtools::install_github("satijalab/seurat", ref = "v5.0.0")
