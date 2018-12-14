#!/bin/sh

# 2018.12.13 
# add new entry to changelog in README

# versioning defined by date in this case
VER_DATE="\``date +%Y.%m.%d`\`"
# add a placeholder hint line
echo '  - add changes here (markdown w/ bullets works well...)' >> temp-cl.txt
# open in vi
vi temp-cl.txt
# sed versioning to top of temp file
sed -i "1i$VER_DATE" temp-cl.txt
# add newline to keep md formatting correctly
echo "\n" >> temp-cl.txt
# sed new entry into README append to top of chaglelog section
sed -i '/###### changelog/r temp-cl.txt' README.md
# remove temp file
rm temp-cl.txt
