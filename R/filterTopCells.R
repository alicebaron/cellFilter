#' Filters the top cells by library sizes
#' 
#' @param input_file Path to a csv matrix with as rows genes and as columns cells' barcodes
#' @param output_file Path to a csv matrix with only the top libraries depending on n
#' @param n The number of cells retained
#' @return the filtered matrix and its dimensions
#' @examples 
#' \dontrun{
#' filterTopCells("counts_matrix.csv", output_file="filtered_matrix.csv", n=100)
#' }
#' @importFrom utils read.csv write.csv
#' @export
filterTopCells<- function(input_file, output_file, n) {
  mat<-(read.csv(input_file, header=TRUE, row.names=1, check.names=FALSE))
  counts<-as.matrix(mat)
  storage.mode(counts)<-"numeric"
  
  if (n < ncol(counts)) {
    libraries_sizes<-colSums(counts)
    first_indices<-order(libraries_sizes, decreasing = TRUE)[seq_len(n)]
    counts<-counts[, first_indices, drop = FALSE]
  }
  
  df<-data.frame(gene=rownames(counts), counts, check.names = FALSE, stringsAsFactors = FALSE)
  write.csv(df, file = output_file, row.names = FALSE)
  
  return(list(n_cells_kept=ncol(counts), n_genes=nrow(counts), n_cells=ncol(counts)))
}