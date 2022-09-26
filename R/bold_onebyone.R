bold_onebyone <- function(data, speciesvar) {

	# loading required packages
	require(bold)
	require(crayon)
	require(dplyr)

	# creating temporary null data.frame
	tmp <- NULL

	# error
	e <- simpleError("Error")

	# starting the loop
	for (i in 1:nrow(data)){

		# wait one second before another search
		Sys.sleep(1)

		# declaring the species variable
		sp <- as.character(data[i, speciesvar])

		cat("\nSpecies", red$bold(sp), ", number", red(i), ".")

		# tryCatch the results
		attempt <- tryCatch({

			bold::bold_specimens(taxon = sp)

			}, error = function(e) {})

		# if it's null, try next species
		if (is.null(attempt)) {
			next
		}

		# gather results
		tmp <- rbind(tmp, attempt)

	}

	return(tmp)

}


