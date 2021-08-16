# Can we identify AGN from host galaxy imaging?
Work in progress by Ziting Guo (Yale-NUS), John F. Wu (STScI), and Chelsea E. Sharon (Yale-NUS)

# Data
We identify star-forming galaxies and AGN from the Sloan Digital Sky Survey (SDSS) using the `Galaxy`, `GalSpecLine`, `GalSpecInfo`, `GalSpecExtra`, and `PhotoObjDR7` catalogs. We query SDSS photometric and spectroscopic data for ~250,000 objects using [CasJobs/SciServer](http://skyserver.sdss.org/CasJobs). We also obtain image cutouts in JPG format using a method similar to the one described in [Wu & Boada 2019, MNRAS, 484, 4683](https://github.com/jwuphysics/galaxy-cnns).

# Models
We compare various models for predicting whether an image cutout contains an AGN.

# References
This work makes use of the [MPA-JHU SDSS catalogs](https://www.sdss.org/dr16/spectro/galaxy_mpajhu/), as well as SDSS SkyServer [Image Cutout Service](http://skyserver.sdss.org/dr16/en/help/docs/api.aspx).
* [Kauffmann et al. 2003, MNRAS, 346, 1055.](https://ui.adsabs.harvard.edu/abs/2003MNRAS.346.1055K/abstract)
* [Brinchmann et al. 2004, MNRAS, 351, 1151.](https://ui.adsabs.harvard.edu/abs/2004MNRAS.351.1151B/abstract)
* [Tremonti et al. 2004, ApJ, 513, 898.](https://ui.adsabs.harvard.edu/abs/2004ApJ...613..898T/abstract)
