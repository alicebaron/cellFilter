# cellFilter

## Installation 
devtools::install_github("alicebaron/cellFilter")

## Building the Docker image
docker build -t filterimage . 

## Example
Rscript -e 'library(cellFilter); runFilter("data", "counts_matrix.csv", output_name="filtered_matrix.csv", n=100)'