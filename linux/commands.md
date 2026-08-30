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
Moves or renames files and directory


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

# Process Management

## Processes

ps:
Displays currently running processes.

ps -e:
Displays all running processes.

ps -ef:
Displays all processes with detailed information, including PID and PPID.

PID:
Process ID.
A unique identifier assigned to a process.

PPID:
Parent Process ID.
Identifies the parent process of the current process.

Example:
ps -ef

Process hierarchy:
A process can create child processes.
The child process has the PID of its parent in the PPID field.

Example:
bash → sleep

The bash process is the parent of the sleep process.

## Process Control

sleep:
Pauses execution for a specified amount of time.

Example:
sleep 60

kill:
Sends a signal to a process.

Example:
kill 2200

The PID identifies the process to which the signal is sent.

## Background Jobs

jobs:
Displays jobs started by the current shell.

&:
Starts a command in the background.

Example:
sleep 120 &

bg:
Continues a stopped job in the background.

Example:
bg %1

fg:
Brings a background job to the foreground.

Example:
fg %1

Job numbers are local to the current shell and are written using %.

Example:
jobs
[1]+ Running sleep 120 &

# Bash Scripting

## Bash Scripts

A Bash script is a text file containing commands that Bash executes sequentially.

Example:

#!/bin/bash
echo "Hello, Cloud Engineer"

The first line is called the shebang.
It specifies which interpreter should execute the script.

A script can be executed directly when it has execute permission.

Example:
chmod +x hello.sh
./hello.sh

## Variables

Variables store values that can be used later in a script.

Example:

name="Tiziano"
role="Cloud Engineer"

echo "Hello, $name"
echo "You are learning $role"

Variables are referenced using $ followed by the variable name.

## Positional Parameters

Arguments passed to a Bash script are available through positional parameters.

$1:
First argument.

$2:
Second argument.

$#:
Number of arguments.

$@:
All arguments.

Example:

./hello.sh Tiziano "Cloud Engineer"

$1 = Tiziano
$2 = Cloud Engineer
$# = 2

"$@" preserves each argument as a separate element, including arguments containing spaces.

## Exit Status

$?:
Contains the exit status of the last executed command.

An exit status of 0 normally means success.
A non-zero exit status normally indicates an error or failure.

Example:

echo $?

exit:
Terminates a script and returns an exit status.

Example:
exit 1

## Conditional Execution

&&:
Executes the next command only if the previous command succeeds.

Example:
mkdir test && echo "Directory created"

||:
Executes the next command only if the previous command fails.

Example:
mkdir test || echo "Could not create directory"

&& and || can be combined to create conditional command chains.

## Conditions

if:
Executes commands depending on whether a condition is true.

Basic structure:

if [ condition ]; then
command
else
command
fi

## Numeric Comparisons

-eq:
Equal to.

-ne:
Not equal to.

-lt:
Less than.

-gt:
Greater than.

-le:
Less than or equal to.

-ge:
Greater than or equal to.

Example:

if [ $# -ne 2 ]; then
echo "Error: you must provide exactly 2 arguments"
exit 1
fi

## String Tests

-z:
Tests whether a string is empty.

Example:

if [ -z "$1" ]; then
echo "Error: name cannot be empty"
exit 1
fi

## File Tests

-f:
Tests whether a path is a regular file.

-r:
Tests whether the file is readable.

-w:
Tests whether the file is writable.

-x:
Tests whether the file is executable.

Example:

if [ -f "$file" ]; then
echo "File exists"
fi

# Loops

## for

for:
Repeats a block of commands for each element in a list.

Basic structure:

for item in list
do
command
done

Example:

for name in Marco Luca Anna
do
echo "Hello $name"
done

## Looping Through Script Arguments

"$@":
Can be used with a for loop to process every argument passed to the script.

Example:

for name in "$@"
do
echo "Hello $name"
done

Example:

./loop.sh Tiziano Marco Sara Luca

The loop processes each argument separately.

## File Automation Example

A for loop can be combined with file tests to automate operations on multiple files.

Example:
```bash
for file in "$@"
do
if [ -f "$file" ]; then
ls -l "$file"


    if [ -r "$file" ]; then
        echo "readable"
    else
        echo "not readable"
    fi

    if [ -w "$file" ]; then
        echo "writable"
    else
        echo "not writable"
    fi

    if [ -x "$file" ]; then
        echo "executable"
    else
        echo "not executable"
    fi
else
    echo "File not found: $file"
fi

done
```

This combines loops, conditions, positional parameters, file tests and Linux permissions.

# Bash and Linux Permissions

Bash file tests such as -r, -w and -x can be used to check whether the current user has the corresponding access to a file.

Example:

[ -r "$file" ]

returns a successful status when the file is readable by the current user.

Permissions can be changed with chmod.

Example:

chmod u-w file1.txt

This removes write permission from the owner.

Example:

chmod u-r file1.txt

This removes read permission from the owner.

Example:

chmod 644 file1.txt

Sets read/write permission for the owner and read-only permission for group and others.
