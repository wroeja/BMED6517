library(BiocFileCache)
library(rhdf5)

download_hdf5_file <- function(url) {
    # Set up the file cache directory
    options(BiocFileCache.dir = "./cache")

    # Download the file to the cache
    file_path <- BiocFileCache::cache_file(url)

    # Open the HDF5 file
    hdf5_file <- H5Fopen(file_path, "H5F_ACC_RDONLY")

    # Get a list of all the datasets in the file
    datasets <- h5ls(hdf5_file, recursive = TRUE)

    # Read in the data from each dataset
    data_list <- list()
    for (dataset_name in datasets$name) {
        data_list[[dataset_name]] <- h5read(hdf5_file, dataset_name)
    }

    # Close the HDF5 file
    H5Fclose(hdf5_file)

    # Return the list of data
    return(data_list)
}
