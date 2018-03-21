##### shell-scripting-bash
- rename all files in dir
```bash
for f in * ; do
> mv "$f" "$f.<ext>"
> done
```
