#' Run a function that filters the top cells by library sizes
#' 
#' @param data_dir Path to a shared folder between the host and the container 
#' @param input_name Path to a csv matrix with as rows genes and as columns cells' barcodes
#' @param output_name Path to a csv matrix with only the top libraries depending on n
#' @param n The number of cells retained
#' @return the filtered matrix and its dimensions
#' @examples 
#' \dontrun{
#' runFilter("data", "counts_matrix.csv", output_name="filtered_matrix.csv", n=100)
#' }
#' @importFrom utils read.csv write.csv
#' @export
runFilter<-function(data_dir, input_name, output_name, n) {
  cmd <- sprintf ( "docker run --rm -v %s:/data filterimage %s %s %d", 
                   normalizePath(data_dir), 
                   file.path("/data",input_name), 
                   file.path("/data", output_name),
                   as.integer(n)
                   )
  system(cmd)
}