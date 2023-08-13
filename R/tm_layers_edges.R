#' Map layer: edges of a (sf)network
#' 
#' Map layer that draws the edges of a (sf)network.
#' 
#' @param col,col.scale,col.legend,col.free Visual variable that determines the col color. See details.
#' @param lwd,lwd.scale,lwd.legend,lwd.free Visual variable that determines the line width. See details.
#' @param lty,lty.scale,lty.legend,lty.free Visual variable that determines the line type. See details.
#' @param col_alpha,col_alpha.scale,col_alpha.legend,col_alpha.free Visual variable that determines the border color alpha transparency. See details.
#' @param linejoin,lineend line join and line end. See \code{\link[grid:gpar]{gpar}} for details.
#' @param plot.order Specification in which order the spatial features are drawn. See \code{\link[tmap:tm_plot_order]{tm_plot_order}} for details.
#' @param trans.args,mapping.args lists that are passed on to internal transformation and mapping functions respectively
#' @param zindex Map layers are drawn on top of each other. The \code{zindex} numbers (one for each map layer) determines the stacking order. By default the map layers are drawn in the order they are called.
#' @param group Name of the group to which this layer belongs. This is only relevant in view mode, where layer groups can be switched (see `group.control`)
#' @param group.control In view mode, the group control determines how layer groups can be switched on and off. Options: `"radio"` for radio buttons (meaning only one group can be shown), `"check"` for check boxes (so multiple groups can be shown), and `"none"` for no control (the group cannot be (de)selected).
#' @export
#' @example ./examples/tm_network.R
tm_edges = function(col = tm_const(),
					col.scale = tm_scale(),
					col.legend = tm_legend(),
					col.free = NA,
					lwd = tm_const(),
					lwd.scale = tm_scale(),
					lwd.legend = tm_legend(),
					lwd.free = NA,
					lty = tm_const(),
					lty.scale = tm_scale(),
					lty.legend = tm_legend(),
					lty.free = NA,
					col_alpha = tm_const(),
					col_alpha.scale = tm_scale(),
					col_alpha.legend = tm_legend(),
					col_alpha.free = NA,
					linejoin = "round",
					lineend = "round",
					plot.order = tm_plot_order("AREA", reverse = FALSE, na.order = "bottom"),
					trans.args = list(),
					mapping.args = list(),
					zindex = NA,
					group = NA,
					group.control = "check") {
	
	tm = tm_lines(col = col, col.scale = col.scale, col.legend = col.legend, col.free = col.free,
				  lwd = lwd, lwd.scale = lwd.scale, lwd.legend = lwd.legend, lwd.free = lwd.free,
				  lty = lty, lty.scale = lty.scale, lty.legend = lty.legend, lty.free = lty.free,
				  col_alpha = col_alpha, col_alpha.scale = col_alpha.scale, col_alpha.legend = col_alpha.legend, col_alpha.free = col_alpha.free,
				  linejoin = linejoin,
				  lineend = lineend,
				  plot.order = plot.order,
				  trans.args = trans.args,
				  mapping.args = mapping.args,
				  zindex = zindex,
				  group = group,
				  group.control = group.control)

	tm[[1]]$layer = c("edges", "lines")
	tm
}
