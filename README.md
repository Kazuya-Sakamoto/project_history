# project_history

project_history is a Bash script designed to help users track file modifications within a specified directory. This tool is particularly useful in environments where files are frequently changed, such as development projects. It allows users to identify recently modified files quickly, highlighting those that have changed since a specified reference date.

Features
Color-Coded Output: Files modified since the reference date are highlighted in red, files modified within the last month are shown in green, and older files are displayed in white.
Customizable Date Filtering: Users can specify a date to filter the modifications.
Exclusion of Hidden Directories: The script automatically excludes hidden directories (e.g., .git) to focus on the main content.

## Features

- Color-Coded Output: Files modified since the reference date are highlighted in red, files modified within the last month are shown in green, and older files are displayed in white.
- Customizable Date Filtering: Users can specify a date to filter the modifications.
- Exclusion of Hidden Directories: The script automatically excludes hidden directories (e.g., .git) to focus on the main content.

## Requirements

- macOS (Due to specific usage of date -jf and stat -f commands)
- Bash shell

## Usage

- Make the Script Executable

```bash
$ chmod +x project_history.sh
```

- Run the Script:

```bash
$ ./project_history.sh
```

## Output Description

```bash
Recently modified files in the specified directory and its subdirectories (excluding directories starting with .), sorted by oldest first:
Type       Permissions  Size  Date         Time     Name
-rw-r--r-- 644          14K   2023-09-16   14:33    example/.vercelignore
-rw-r--r-- 644          79B   2023-09-24   01:30    example/.vercel.json
-rw-r--r-- 644          23B   2023-10-09   11:52    src/robots.txt
-rw-r--r-- 644          479K  2023-10-15   00:26    src/public/favicon.png
-rw-r--r-- 644          43K   2023-11-04   12:04    src/assets/img/moon.png
```

- Type: Shows the type of file.
- Permissions: Displays the file permissions.
- Size: Indicates the file size.
- Date and Time: Shows the last modification date and time.
- Name: Provides the full path of the file.

  Files will be listed starting from the oldest modified to the most recently modified. The output is sorted by the modification date, making it easy to track changes over time.

## License

This project is licensed under the MIT License - see the LICENSE file for details.
