# statistics-course-work
Statistics course work completed at SUNY Binghamton as part of Bioengineering B.S degree- Fall 2009 to Spring 2013.

Analyses are run in R. Discussions are presented in Markdown. 

# Course names
BIOL 117: Intro to Organisms and Population Biology (Pollination Report with Chi Square test)  
BE 202: Biological Networks (Network Analysis of MTA Subway system)  
BE 351: Data Acquisition and Analysis I (General Statistical Testing)  
BE 352: Data Acquisition and Analysis II (General Statistical Testing)  
BE 410: Complexity in Biological Systems (Differential equations representing water strider interactions)  

# Installing R  
OS Version: ubuntu 18.04, bionic

1. echo source
```
sudo sh -c 'echo "deb https://cloud.r-project.org/bin/linux/ubuntu bionic-cran35/"'
```
2. run updates
```
sudo apt-get update
```
3. install R
```
sudo apt-get install r-base
```
4. activation of 'backports' repositories
```
sudo sh -c 'echo "deb https://<my.favorite.ubuntu.mirror>/ bionic-backports main restricted universe"'
```  

## Run
Enter shell
```
R
```
Expected output
```
R version 3.4.4 (2018-03-15) -- "Someone to Lean On"
Copyright (C) 2018 The R Foundation for Statistical Computing
Platform: x86_64-pc-linux-gnu (64-bit)

R is free software and comes with ABSOLUTELY NO WARRANTY.
You are welcome to redistribute it under certain conditions.
Type 'license()' or 'licence()' for distribution details.

R is a collaborative project with many contributors.
Type 'contributors()' for more information and
'citation()' on how to cite R or R packages in publications.

Type 'demo()' for some demos, 'help()' for on-line help, or
'help.start()' for an HTML browser interface to help.
Type 'q()' to quit R.
```
Run Script
```
Rscript [file-name.r]
```

