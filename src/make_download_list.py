import pandas as pd
from pathlib import Path
PATH = Path(__file__).resolve().parent.parent

layer = 'sdss' # vs ls-dr9
pixscale = 0.262
size = 160

df = pd.read_csv(PATH/'data/agn_cleaned.csv')

with open(PATH/'data/image_urls.txt', 'a') as f:
    for row in df.itertuples():
        objID = row.objID
        ra, dec = row.ra, row.dec

        f.write(f'{objID}.jpg http://legacysurvey.org/viewer/cutout.jpg?ra={ra}&dec={dec}&pixscale={pixscale}&layer={layer}&size={size}\n')
