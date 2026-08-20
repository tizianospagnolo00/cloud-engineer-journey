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


## Redirection

>:
Redirects command output to a file.
Creates the file if it does not exist.
Overwrites the file if it already exists.

>>:
Redirects command output to a file.
Creates the file if it does not exist.
Appends to the file if it already exists.

Example:
grep -i "error" test.log > errors.log


## File Removal

rm:
Removes files.

Example:
rm test.log


## Finding Files and Directories

find:
Searches for files and directories based on conditions such as name, type, or depth.

-type f:
Searches only for files.

-type d:
Searches only for directories.

-name:
Searches by name or pattern.

-maxdepth:
Limits how deep find searches inside directories.

Examples:
find . -name "*.md"
find .. -type f -name "*.md"
find .. -maxdepth 1 -type d


## File Permissions

chmod:
Changes file and directory permissions.

Permission types:
r = read
w = write
x = execute

Permission groups:
u = owner
g = group
o = others
a = all

Numeric permissions:
r = 4
w = 2
x = 1

Examples:
chmod 755 file
chmod 644 file
chmod u+x file
chmod g+w file
chmod u=rwx,g=rx,o= file
