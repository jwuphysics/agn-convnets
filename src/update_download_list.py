# updates the list of downloaded Legacy jpg images based on what already has been downloaded
import shutil
import numpy as np
import pandas as pd
from pathlib import Path

PATH = Path(__file__).resolve().parent.parent

# rename old list
urls_file = f'{PATH}/data/image_urls.txt'
shutil.copy(urls_file, urls_file+'.OLD')

# compare list to downloaded files
df = pd.read_csv(urls_file, delim_whitespace=True, names=['filenames', 'urls'])

downloaded_files = list((PATH/'images-legacy').glob('*.jpg'))
filenames = np.array([f.name for f in downloaded_files])

df = df.set_index('filenames')
df = df.loc[df.index.difference(filenames)]


df.to_csv(urls_file, sep='\t', index=True, header=False)
