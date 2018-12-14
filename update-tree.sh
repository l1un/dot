#!/bin/sh

# 2018.12.11 
# remove old tree, generate new tree, add to README

# remove everything between structure and packages 
sed -n -i '1,/###### structure/p;/###### packages/,$p' README.md

# open formatting
echo '```' >> temp.txt

# create tree, ignore (-I) node_modules, old, temp.txt and .git dirs, include (-a) dotfiles,  put in temp .txt 
tree -Ia 'node*|.git|old|temp.txt' >> temp.txt 

# add timestamp
echo "last generated: `date`" >> temp.txt

# close formatting
echo '```' >> temp.txt

# sed formatted output to README structure section
sed -i '/###### structure/r temp.txt' README.md

# remove temp file
rm temp.txt
