# project_history

<div style="display: flex; gap: 15px; flex-wrap: wrap; align-items: center;">
  <img src="https://img.shields.io/badge/License-MIT-blue" alt="License">
  <img src="https://img.shields.io/badge/Shell%20Script-Bash-121011?logo=gnu-bash&logoColor=white" alt="Shell Script">
</div>

<br />

project_history is a Bash script designed to help users track file modifications within a specified directory. This tool is particularly useful in environments where files are frequently changed, such as development projects. It allows users to identify recently modified files quickly, highlighting those that have changed since a specified reference date.

## Features

- Color-Coded Output: Files modified since the reference date are highlighted in red to indicate recent changes, and all other files are displayed in white for standard visibility.
- Customizable Date Filtering: Users can enter a specific reference date to filter modifications. Files modified after this date are considered "recent" and are highlighted.
- Exclusion of Hidden Directories: The script automatically excludes hidden directories (like those starting with '.') to ensure only relevant content is processed. This feature helps users to focus on the main files without the clutter from system or hidden files.

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
Permissions  Size  Date        Time    Name
-rw-r--r-- 644    2023-09-16   14:33    example/.vercelignore
-rw-r--r-- 644    2023-09-24   01:30    example/.vercel.json
-rw-r--r-- 644    2023-10-09   11:52    src/robots.txt
-rw-r--r-- 644    2023-10-15   00:26    src/public/favicon.png
-rw-r--r-- 644    2023-11-04   12:04    src/assets/img/moon.png
```

- Permissions: Displays the file permissions.
- Size: Indicates the file size.
- Date and Time: Shows the last modification date and time.
- Name: Provides the full path of the file.

  Files will be listed starting from the oldest modified to the most recently modified. The output is sorted by the modification date, making it easy to track changes over time.

## License

This project is licensed under the MIT License - see the LICENSE file for details.
