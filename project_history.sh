#!/bin/bash

prompt_for_directory() {
  echo "Please enter the full path to the directory you wish to analyze (e.g., /Users/username/project)"
  read -r DIRECTORY
  if [ ! -d "$DIRECTORY" ]; then
    echo "Error: The specified directory does not exist. Please check the path and try again."
    exit 1
  fi
}

prompt_for_reference_date() {
  echo "Please enter the reference date in YYYY-MM-DD format (e.g., 2024-01-01):"
  read -r REF_DATE
  ref_epoch=$(date -jf "%Y-%m-%d" "$REF_DATE" +%s)
  current_epoch=$(date +%s)
}

list_recently_modified_files() {
  echo "Listing files in '$DIRECTORY' and its visible subdirectories that have been modified, displayed from the oldest to the most recent:"
  find "$DIRECTORY" -type f -not -path "*/.*/*" -print0 |
    xargs -0 stat -f "%m %N" |
    sort -n |
    awk -v ref_epoch="$ref_epoch" -v current_epoch="$current_epoch" 'BEGIN {
        printf("\033[1;37m%-10s %5s %-12s %-5s %s\033[0m\n", "Permissions", "Size", "Date", "Time", "Name");
    }
    {
        file_epoch = $1;
        file_path = $2;
        one_month_sec = 30 * 24 * 60 * 60;
        if (file_epoch < ref_epoch) {
            color = "\033[31m"; # 赤色で表示
        } else {
            color = "\033[37m"; # 通常の白色で表示
        }
        system("stat -f \"%Sp %z %Sm %N\" -t \"%Y-%m-%d %H:%M:%S\" " file_path " | awk -v color='\''" color "'\'' '\''{printf(color \"%-10s %-10s %5s %-12s %-5s %s\\033[0m\\n\", $1, $2, $3, $4, $5, $6);}'\''");
    }'
}

prompt_for_directory
prompt_for_reference_date
list_recently_modified_files
