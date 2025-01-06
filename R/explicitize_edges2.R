# same as sfnetworks:::explicitize_edges, but this one takes a function and further arguments
explicitize_edges2 = function (x, fun, ...) {
	if (sfnetworks:::has_explicit_edges(x)) {
		x
	}
	else {
		nodes = sfnetworks:::pull_node_geom(x)
		ids = sfnetworks:::edge_boundary_node_indices(x, matrix = TRUE)
		from = nodes[ids[, 1]]
		to = nodes[ids[, 2]]
		lines = do.call(fun, c(list(from, to), list(...)))
		sfnetworks:::mutate_edge_geom(x, lines)
	}
}
