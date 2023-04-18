library(BiocManager) #this line is here to stop renv from trying to remove BiocManager, as it is not invoked directly in any script
library(rhdf5)

download_hdf5_files <- function(url_list) {
    data_list <- list()

    for (i in seq_along(url_list)) {
        url <- url_list[i]
        tmp_file <- tempfile()

        # Download HDF5 file from URL to temporary file
        download.file(url, destfile = tmp_file, mode = "wb")

        # Read HDF5 file into R data structure
        h5_file <- H5Fopen(tmp_file)
        data_list[[i]] <- h5read(h5_file, "/", recursive = TRUE)
        H5Fclose(h5_file)

        # Delete temporary file
        unlink(tmp_file)
    }

    return(data_list)
}
