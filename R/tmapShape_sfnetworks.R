#' Implementation of tmap::tmapGetShapeMeta1 for sfnetwork
#' 
#' Implementation of tmap::tmapGetShapeMeta1 for sfnetwork
#' 
#' @method tmapGetShapeMeta1 sfnetwork
#' @import tmap
#' @keywords internal
#' @export
tmapGetShapeMeta1.sfnetwork = function(shp, o) {
	# get variable names
	# (only relevant for stars:) get dimension names and values (that can serve as variables)
	
	# for sfnetwork: working, but with (unnesseary?) processing 
	# are there direct methods to retrieve node and edge variable names?
	
	# nodes = sf::st_as_sf(shp, "nodes")
	# edges = sf::st_as_sf(sfnetworks:::explicitize_edges(shp), "edges")	
	# 
	# vars_nodes = setdiff(names(nodes), attr(nodes, "sf_column"))
	# vars_edges = setdiff(names(edges), attr(edges, "sf_column"))
	# 
	vars_nodes = get_names(shp, "nodes")
	vars_edges = get_names(shp, "edges")
	
	
	vars = unique(c(vars_nodes, vars_edges))
	
	dims = character(0)
	dims_vals = list()
	
	
	list(vars = vars,
		 dims = dims, 
		 dims_vals = dims_vals)
}


#' Implementation of tmap::tmapSubsetShp for sfnetwork
#' 
#' Implementation of tmap::tmapSubsetShp for sfnetwork
#' 
#' @method tmapSubsetShp sfnetwork
#' @import tmap
#' @keywords internal
#' @export
tmapSubsetShp.sfnetwork = function(shp, vars) {
	# subset the original object by the variables that are used to create the tmap plot? Why: to reduce the object size/computation time of the next methods
	
	# for sfnetwork: to do
	shp
}

#' Implementation of tmap::tmapGetShapeMeta2 for sfnetwork
#' 
#' Implementation of tmap::tmapGetShapeMeta2 for sfnetwork
#' 
#' @method tmapGetShapeMeta2 sfnetwork
#' @import tmap
#' @keywords internal
#' @export
tmapGetShapeMeta2.sfnetwork = function(shp, smeta, o) {

	# get the levels of factor variables (in advance needed for faceting) and store them in smeta$vars_lev (smeta stands for 'shape meta')
	
	# sfnetwork: are there direct methods to retrieve factor levels?
	
	
	nodes = sf::st_as_sf(shp, "nodes")
	edges = sf::st_as_sf(sfnetworks:::explicitize_edges(shp), "edges")	
	
	vars_nodes = setdiff(names(nodes), attr(nodes, "sf_column"))
	vars_edges = setdiff(names(edges), attr(edges, "sf_column"))
	
	vars = c(vars_nodes, vars_edges)

	smeta$vars_levs = c(lapply(seq_along(vars_nodes), function(i) {
		get_fact_levels_na(nodes[[i]], o)
	}),
		lapply(seq_along(vars_edges), function(i) {
			get_fact_levels_na(edges[[i]], o)
	}))
	names(smeta$vars_levs) = vars
	smeta
}



#' Implementation of tmap::tmapShape for sfnetwork
#' 
#' Implementation of tmap::tmapShape for sfnetwork
#' 
#' @method tmapShape sfnetwork
#' @import tmap
#' @import data.table
#' @keywords internal
#' @export
tmapShape.sfnetwork = function(shp, is.main, crs, bbox, unit, filter, shp_name, smeta, o, tmf) {
	

	# the main method to process spatial objects
	# in tmap, the geometry is separated from the data
	
	# geometry: stored in an object called shapeTM, which contains:
	# - shp: for sf objects an sfc object, for stars an empty raster
	# - tmapID: id values, one for each spatial feature (so 1,...n)
	# - bbox
	
	# data: a data.table with two additional columns:
	# - tmapID__: the id that can be joined to the geometry tmapID
	# - sel__: a logical that determines if this feature is plotted (only relevant if filter from tm_shape is used)
	
	# for sfnetwork: the current rudimentary approach is to make one large sf object from nodes and edges, so basically a geometry collection with points and lines.
	
	
	
	if (!is.null(crs) && sf::st_crs(shp) != crs) {
		shp = sf::st_transform(shp, crs = crs)
	}
	
	nodes = sf::st_as_sf(shp, "nodes")
	edges = sf::st_as_sf(sfnetworks:::explicitize_edges(shp), "edges")	
	
	geom_nodes = sf::st_geometry(nodes)
	geom_edges = sf::st_geometry(edges)
	
	N = length(geom_nodes)
	E = length(geom_edges)
	
	dt_nodes = as.data.table(sf::st_drop_geometry(nodes))
	if (nrow(dt_nodes) == 0) {
		dt_nodes = data.table(tmapID__ = 1L:N)
	} else {
		dt_nodes[, tmapID__ := 1L:N]
	}
	
	dt_edges = as.data.table(sf::st_drop_geometry(edges))
	if (nrow(dt_edges) == 0) {
		dt_edges = data.table(tmapID__ = (N + 1L):(N+E))
	} else {
		dt_edges[, tmapID__ := (N + 1L):(N+E)]
	}
	
	dt = rbind(dt_nodes, dt_edges, fill = T)
	sfc = c(geom_nodes, geom_edges)
	
	#############
	## below same as tmapShape.sf
	#############
	
	dtcols = copy(names(dt))
	
	#if (is.null(bbox)) bbox = sf::st_bbox(sfc)
	
	if (is.null(filter)) filter = rep(TRUE, nrow(dt))
	dt[, ':='(tmapID__ = 1L:nrow(dt), sel__ = filter)]
	
	tmap::make_by_vars(dt, tmf, smeta)
	
	shpTM = shapeTM(shp = sfc, tmapID = 1L:(length(sfc)), bbox = bbox)
	
	structure(list(shpTM = shpTM, dt = dt, is.main = is.main, dtcols = dtcols, shpclass = "sfc", bbox = bbox, unit = unit, shp_name = shp_name, smeta = smeta), class = "tmapShape")
}

