# install.R

# Install devtools if it's not installed
if (!requireNamespace("devtools", quietly = TRUE)) {
    install.packages("devtools")
}

# Install required packages (if they are not already installed)
packages <- c("tidyverse", "ggplot2")
new_packages <- packages[!(packages %in% installed.packages()[, "Package"])]
if (length(new_packages)) {
    install.packages(new_packages)
}

# Install Seurat v5 from GitHub
tryCatch({
    devtools::install_github("satijalab/seurat", ref = "v5.0.0")
}, error = function(e) {
    message("Error installing Seurat: ", e$message)
    quit(status = 1)
})

# Check if Seurat is installed correctly
if (!requireNamespace("Seurat", quietly = TRUE)) {
    message("Seurat installation failed.")
} else {
    message("Seurat installed successfully.")
}
