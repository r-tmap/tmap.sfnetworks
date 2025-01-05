#' Map layer: nodes of a (sf)network
#' 
#' Map layer that draws the nodes of a (sf)network.
#' 
#' @param fill,fill.scale,fill.legend,fill.free Visual variable that determines the fill color. See details.
#' @param col,col.scale,col.legend,col.free Visual variable that determines the col color. See details.
#' @param size,size.scale,size.legend,size.free Visual variable that determines the size. See details.
#' @param shape,shape.scale,shape.legend,shape.free Visual variable that determines the shape. See details.
#' @param lwd,lwd.scale,lwd.legend,lwd.free Visual variable that determines the line width. See details.
#' @param lty,lty.scale,lty.legend,lty.free Visual variable that determines the line type. See details.
#' @param fill_alpha,fill_alpha.scale,fill_alpha.legend,fill_alpha.free Visual variable that determines the fill color alpha transparency See details.
#' @param col_alpha,col_alpha.scale,col_alpha.legend,col_alpha.free Visual variable that determines the border color alpha transparency. See details.
#' @inheritParams tm_edges
#' @export
#' @example ./examples/tm_network.R
tm_nodes = function(size = tm_const(),
					size.scale = tm_scale(),
					size.legend = tm_legend(),
					size.free = NA,
					fill = tm_const(),
					fill.scale = tm_scale(),
					fill.legend = tm_legend(),
					fill.free = NA,
					col = tm_const(),
					col.scale = tm_scale(),
					col.legend = tm_legend(),
					col.free = NA,
					shape = tm_const(),
					shape.scale = tm_scale(),
					shape.legend = tm_legend(),
					shape.free = NA,
					lwd = tm_const(),
					lwd.scale = tm_scale(),
					lwd.legend = tm_legend(),
					lwd.free = NA,
					lty = tm_const(),
					lty.scale = tm_scale(),
					lty.legend = tm_legend(),
					lty.free = NA,
					fill_alpha = tm_const(),
					fill_alpha.scale = tm_scale(),
					fill_alpha.legend = tm_legend(),
					fill_alpha.free = NA,
					col_alpha = tm_const(),
					col_alpha.scale = tm_scale(),
					col_alpha.legend = tm_legend(),
					col_alpha.free = NA,
					plot.order = tm_plot_order("size"),
					zindex = NA,
					group = NA,
					group.control = "check",
					popup.vars = NA,
					popup.format = list(),
					hover = NA,
					id = "",
					options = opt_tm_nodes()) {
	
	tm = tm_symbols(size = size, size.scale = size.scale, size.legend = size.legend, size.free = size.free,
				  fill = fill, fill.scale = fill.scale, fill.legend = fill.legend, fill.free = fill.free,
				  col = col, col.scale = col.scale, col.legend = col.legend, col.free = col.free,
				  shape = shape, shape.scale = shape.scale, shape.legend = shape.legend, shape.free = shape.free,
				  lwd = lwd, lwd.scale = lwd.scale, lwd.legend = lwd.legend, lwd.free = lwd.free,
				  lty = lty, lty.scale = lty.scale, lty.legend = lty.legend, lty.free = lty.free,
				  fill_alpha = fill_alpha, fill_alpha.scale = fill_alpha.scale, fill_alpha.legend = fill_alpha.legend, fill_alpha.free = fill_alpha.free,
				  col_alpha = col_alpha, col_alpha.scale = col_alpha.scale, col_alpha.legend = col_alpha.legend, col_alpha.free = col_alpha.free,
				  plot.order = plot.order,
				  options = options,
				  zindex = zindex,
				  group = group,
				  group.control = group.control,
					popup.vars = popup.vars,
					popup.format = popup.format,
					hover = hover,
					id = id
					)
	
	tm[[1]]$layer = c("nodes", "symbols")
	tm
}

#' @param points_only should only point geometries of the shape object (defined in [tmap::tm_shape()]) be plotted? By default `"ifany"`, which means `TRUE` in case a geometry collection is specified.
#' @param point_per specification of how spatial points are mapped when the geometry is a multi line or a multi polygon. One of \code{"feature"}, \code{"segment"} or \code{"largest"}. The first generates a spatial point for every feature, the second for every segment (i.e. subfeature), the third only for the largest segment (subfeature). Note that the last two options can be significant slower.
#' @param on_surface In case of polygons, centroids are computed. Should the points be on the surface? If `TRUE`, which is slower than the default `FALSE`, centroids outside the surface are replaced with points computed with [sf::st_point_on_surface()].
#' @param just not used (yet)
#' @param icon.scale scaling number that determines how large the icons (or grobs) are in plot mode in comparison to proportional symbols (such as bubbles). For view mode, use the argument `grob.dim`
#' @param grob.dim vector of four values that determine how grob objects (see details) are shown in view mode. The first and second value are the width and height of the displayed icon. The third and fourth value are the width and height of the rendered png image that is used for the icon. Generally, the third and fourth value should be large enough to render a ggplot2 graphic successfully. Only needed for the view mode.
#' @rdname tm_nodes
#' @export
opt_tm_nodes = function(points_only = "ifany",
						point_per = "feature",
						on_surface = FALSE,
						icon.scale = 3,
						just = NA,
						grob.dim = c(width=48, height=48, render.width=256, render.height=256)) {
	list(trans.args = list(points_only = points_only, point_per = point_per, on_surface = on_surface, along_lines = FALSE),
		 mapping.args = list(icon.scale = icon.scale,
		 					just = just,
		 					grob.dim = grob.dim))
}

