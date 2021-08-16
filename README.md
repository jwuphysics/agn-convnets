# Can we identify AGN from host galaxy imaging?
Work in progress by Ziting Guo (Yale-NUS), John F. Wu (STScI), and Chelsea E. Sharon (Yale-NUS)

# Data

## Photometric and spectroscopic catalogs
We identify star-forming galaxies and AGN from the Sloan Digital Sky Survey (SDSS) using the `Galaxy`, `GalSpecLine`, `GalSpecInfo`, `GalSpecExtra`, and `PhotoObjDR7` catalogs. We query SDSS photometric and spectroscopic data for ~250,000 objects using [CasJobs/SciServer](http://skyserver.sdss.org/CasJobs). The SQL queries are located in `./data` and can be used to generate a CSV file of galaxies and AGN.

## Image cutouts
We also obtain image cutouts in JPG format using a method similar to the one described in [Wu & Boada 2019, MNRAS, 484, 4683](https://github.com/jwuphysics/galaxy-cnns), except that we obtain data from the DESI Legacy Imaging Surveys.. The scripts in `./src` are for downloading images from the Legacy Survey viewer (which are reprocessed based on the SDSS SkyServer imaging). In order to begin downloading SDSS images: 
1. Create a directory `./images-sdss`
2. Ensure that the catalog data are in the correct file referenced in `./src/make_download_list.py` (i.e., `./data/agn_cleaned.py`), and change the image cutout size and pixel scale as desired (160 and 0.262 by default, respectively).
4. Run `./src/make_download_list.py` to create a text file (`./data/image_urls.txt`) of filenames and URLs that can be retrieved using `wget`.
5. Run `./src/download_images.sh` to download images in parallel (with the option to change the number of parallel downloads)
6. If the download is interrupted at any time, run `./src/update_download_list.py` to update the text file of URLs, and then `./src/download_images.sh` can be run again to proceed.

# Models
We compare various models for predicting whether an image cutout contains an AGN.

# References
This work makes use of the [MPA-JHU SDSS catalogs](https://www.sdss.org/dr16/spectro/galaxy_mpajhu/), as well as [DESI Legacy Imaging Surveys viewer](https://www.legacysurvey.org/viewer/). Yao-Yuan Mao's [Image Viewer Tool](https://yymao.github.io/decals-image-list-tool/) is also a useful resource.

The following papers detail most of the data used in our work:
* [Kauffmann et al. 2003, MNRAS, 346, 1055.](https://ui.adsabs.harvard.edu/abs/2003MNRAS.346.1055K/abstract)
* [Brinchmann et al. 2004, MNRAS, 351, 1151.](https://ui.adsabs.harvard.edu/abs/2004MNRAS.351.1151B/abstract)
* [Tremonti et al. 2004, ApJ, 513, 898.](https://ui.adsabs.harvard.edu/abs/2004ApJ...613..898T/abstract)
