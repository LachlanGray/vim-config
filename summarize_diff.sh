rm -f diffs.txt
git diff | grep -v "^[^+-]" > diffs.txt


