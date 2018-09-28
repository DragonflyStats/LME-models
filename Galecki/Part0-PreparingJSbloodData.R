		#Preparing the Blood Data
		library(nlme)
		blood = groupedData( y ~ meth | item ,
		data = data.frame( y = c(Blood), item = c(row(Blood)),
		meth = rep(c("J","R","S"), rep(nrow(Blood)*3, 3)),
		repl = rep(rep(c(1:3), rep(nrow(Blood), 3)), 3) ),
		labels = list(BP = "Systolic Blood Pressure", method = "Measurement Device"),
		order.groups = FALSE )
		
		#pick out two of the three methods ( use J and S ) 
		
		dat = subset(blood, subset = meth != "R")

