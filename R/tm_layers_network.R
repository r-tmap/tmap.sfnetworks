#' Map layer: (sf)network
#' 
#' Map layer that draws a network. For more (total) flexibility, please use \code{\link{tm_edges}} and \code{\link{tm_nodes}}.
#' 
#' @export
#' @example ./examples/tm_network.R 
tm_network = function() {
	tm_edges() + tm_nodes()
}
