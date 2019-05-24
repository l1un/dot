#!/bin/sh

# 2018.12.11 
# remove old modules, get current modules, add to README

# remove everything between modules and notes
sed -n -i '1,/###### packages/p;/###### notes/,$p' README.md

# open formatting
echo '```' >> temp-mod.txt

# use jq to get devDependencies, add to temp file
echo "devDependencies\n" >> temp-mod.txt
cat ./package.json | jq .devDependencies >> temp-mod.txt 

# use jq to get devDependencies, add to temp file
echo "\ndependencies\n" >> temp-mod.txt
cat ./package.json | jq .dependencies >> temp-mod.txt  # TODO: add condtional logic for null

# add timestamp
echo "\nauto-generated: `date`" >> temp-mod.txt

# close formatting
echo '```' >> temp-mod.txt

# sed formatted output to README packages section
sed -i '/###### packages/r temp-mod.txt' README.md

# remove temp file
rm temp-mod.txt
