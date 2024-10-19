# install_seurat.R
if (!requireNamespace("remotes", quietly = TRUE)) {
  install.packages("remotes")
}
remotes::install_github("satijalab/seurat", ref = "v5.0.0")
