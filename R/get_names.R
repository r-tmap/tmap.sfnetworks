# define functions
nodes_get_names <- function(x) {
	sf_column <- tidygraph::with_graph(x, attr(tidygraph::.N(), "sf_column"))
	all_names <- igraph::vertex_attr_names(x)
	setdiff(all_names, sf_column)
}
edges_get_names <- function(x) {
	all_names <- igraph:::edge_attr_names(x)
	if (!sfnetworks:::has_explicit_edges(x)) {
		return(all_names)
	}
	sf_column <- tidygraph::with_graph(x, attr(tidygraph::.E(), "sf_column"))
	setdiff(all_names, sf_column)
}

get_names <- function(x, active = NULL) {
	if (is.null(active)) {
		active = attr(x, "active")
	}
	switch(
		active, 
		nodes = nodes_get_names(x), 
		edges = edges_get_names(x),
		sfnetworks:::raise_unknown_input(active)
	)
}