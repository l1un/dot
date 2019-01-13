# !/bin/sh
# Sorts file (adjecent comparison), pipes unique, redirects to new file. 
sort unsorted-ununique.txt | uniq > sorted-uniq.txt
