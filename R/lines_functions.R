lines_straight = function (x, y) 
{
	df = rbind(sfheaders::sfc_to_df(x), sfheaders::sfc_to_df(y))
	df = df[order(df$point_id), ]
	lines = sfheaders::sfc_linestring(df, x = "x", y = "y", linestring_id = "point_id")
	st_crs(lines) = st_crs(x)
	st_precision(lines) = st_precision(x)
	lines
}

lines_straight_part = function (x, y, from = 0, to = 1) 
{
	dfx = sfheaders::sfc_to_df(x)
	dfy = sfheaders::sfc_to_df(y)
	
	dfx2 = dfx
	dfy2 = dfy
	
	dfx2$x = dfx$x * (1 - from) + dfy$x * (from)
	dfx2$y = dfx$y * (1 - from) + dfy$y * (from)
	
	dfy2$x = dfx$x * (1 - to) + dfy$x * (to)
	dfy2$y = dfx$y * (1 - to) + dfy$y * (to)
	
	df = rbind(dfx2, dfy2)
	df = df[order(df$point_id), ]
	
	lines = sfheaders::sfc_linestring(df, x = "x", y = "y", linestring_id = "point_id")
	st_crs(lines) = st_crs(x)
	st_precision(lines) = st_precision(x)
	lines
}

lines_curved = function (x, y, curvature = 30) {
	# not working yet
	df = rbind(sfheaders::sfc_to_df(x), sfheaders::sfc_to_df(y))
	df = df[order(df$point_id), ]
	lines = sfheaders::sfc_linestring(df, x = "x", y = "y", linestring_id = "point_id")
	st_crs(lines) = st_crs(x)
	st_precision(lines) = st_precision(x)
	lines
}

