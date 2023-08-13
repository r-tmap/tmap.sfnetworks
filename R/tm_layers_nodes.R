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
#' @param plot.order Specification in which order the spatial features are drawn. See \code{\link[tmap:tm_plot_order]{tm_plot_order}} for details.
#' @param trans.args,mapping.args lists that are passed on to internal transformation and mapping functions respectively
#' @param zindex Map layers are drawn on top of each other. The \code{zindex} numbers (one for each map layer) determines the stacking order. By default the map layers are drawn in the order they are called.
#' @param group Name of the group to which this layer belongs. This is only relevant in view mode, where layer groups can be switched (see `group.control`)
#' @param group.control In view mode, the group control determines how layer groups can be switched on and off. Options: `"radio"` for radio buttons (meaning only one group can be shown), `"check"` for check boxes (so multiple groups can be shown), and `"none"` for no control (the group cannot be (de)selected).
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
					trans.args = list(),
					mapping.args = list(icon.scale = 3,
										just = NA,
										grob.dim = c(width=48, height=48, render.width=256, render.height=256)),
					zindex = NA,
					group = NA,
					group.control = "check") {
	
	tm = tm_lines(size = size, size.scale = size.scale, size.legend = size.legend, size.free = size.free,
				  fill = fill, fill.scale = fill.scale, fill.legend = fill.legend, fill.free = fill.free,
				  col = col, col.scale = col.scale, col.legend = col.legend, col.free = col.free,
				  shape = shape, shape.scale = shape.scale, shape.legend = shape.legend, shape.free = shape.free,
				  lwd = lwd, lwd.scale = lwd.scale, lwd.legend = lwd.legend, lwd.free = lwd.free,
				  lty = lty, lty.scale = lty.scale, lty.legend = lty.legend, lty.free = lty.free,
				  fill_alpha = fill_alpha, fill_alpha.scale = fill_alpha.scale, fill_alpha.legend = fill_alpha.legend, fill_alpha.free = fill_alpha.free,
				  col_alpha = col_alpha, col_alpha.scale = col_alpha.scale, col_alpha.legend = col_alpha.legend, col_alpha.free = col_alpha.free,
				  plot.order = plot.order,
				  trans.args = trans.args,
				  mapping.args = mapping.args,
				  zindex = zindex,
				  group = group,
				  group.control = group.control)
	
	tm[[1]]$layer = c("nodes", "symbols")
	tm
}
