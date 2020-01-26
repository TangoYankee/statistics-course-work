#!/bin/bash
wget -q https://cran.r-project.org/src/contrib/ISwR_2.0-8.tar.gz
wget -q https://cran.r-project.org/src/contrib/gtools_3.8.1.tar.gz
wget -q https://cran.r-project.org/src/contrib/gdata_2.18.0.tar.gz
wget -q https://cran.r-project.org/src/contrib/bitops_1.0-6.tar.gz
wget -q https://cran.r-project.org/src/contrib/Archive/caTools/caTools_1.17.1.1.tar.gz
wget -q https://cran.r-project.org/src/contrib/gplots_3.0.1.2.tar.gz
sudo R CMD INSTALL ISwR_2.0-8.tar.gz gtools_3.8.1.tar.gz gdata_2.18.0.tar.gz bitops_1.0-6.tar.gz caTools_1.17.1.1.tar.gz gplots_3.0.1.2.tar.gz
