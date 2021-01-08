#! /bin/bash
cp ~/.shortcuts/backup.sh ~/los/backup.sh && cp ~/storage/shared/Documents/markor/* ~/los/markor && cd ~/los && git add . && git commit -m "Quick sync via Termux Tasker." && git push
