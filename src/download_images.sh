#!/bin/bash

jobs=8

cd ../images-sdss
xargs < ../data/image_urls.txt -P ${jobs} -L 1 wget -q -O
