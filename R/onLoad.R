.onLoad = function(...) {
	tmap::tmapAddLayerOptions("value.const", "size.nodes", .4)
	tmap::tmapAddLayerOptions("value.const", "fill.nodes", "gold")
	tmap::tmapAddLayerOptions("value.const", "col.nodes", "black")
	tmap::tmapAddLayerOptions("value.const", "lwd.nodes", 1)
	
	tmap::tmapAddLayerOptions("value.const", "lwd.edges", 1.5)
	tmap::tmapAddLayerOptions("value.const", "col.edges", "black")
	tmap::tmapAddLayerOptions("values.var", "col.edges", list(seq = "viridis.magma", div = "tol.sunset", unord = "misc.okabe", ord = "viridis.magma", cyc = "tol.rainbow_pu_rd", biv = "pu_gn_bivs"))
}
