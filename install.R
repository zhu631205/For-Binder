# install.R

# Install devtools if it's not installed (to install Seurat from GitHub)
if (!requireNamespace("devtools", quietly = TRUE)) {
  install.packages("devtools")
}

# Try installing Seurat v5 from GitHub
tryCatch({
  devtools::install_github("satijalab/seurat", ref = "v5.0.0")
}, error = function(e) {
  message("Error installing Seurat: ", e$message)
  quit(status = 1)
})

