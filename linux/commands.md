# Linux Commands Notes


## Navigation

pwd:
Print Working Directory.
Shows the current directory.

cd:
Change Directory.
Used to move between folders.

ls:
List files and directories.


## File management

mkdir:
Creates a new directory

mv:
Moves or renames files

cat:
Display file contents.


## File Reading

cat:
Displays the entire contents of a file.

less:
Displays a file one page at a time.
Useful for reading large files and searching within them.

head:
Displays the first 10 lines of a file by default.

tail:
Displays the last 10 lines of a file by default.
Useful for checking recent log entries.


## Searching and Filtering

grep:
Searches for a string or pattern inside text.

-i:
Ignores differences between uppercase and lowercase letters.

-n:
Shows the line number of each matching line.

Example:
grep -in "error" test.log


## Counting

wc:
Counts lines, words and bytes.

-l:
Counts lines.

-w:
Counts words.

Example:
wc -l test.log


## Pipes

|:
Passes the output of one command to another command.

Example:
grep -i "error" test.log | wc -l

This searches for lines containing "error" and counts them.
