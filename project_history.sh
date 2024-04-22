#!/bin/bash

echo "Enter the directory path (example: /Users/username/project):"
read DIRECTORY

if [ ! -d "$DIRECTORY" ]; then
  echo "The specified directory does not exist."
  exit 1
fi

echo "Enter the reference date (YYYY-MM-DD) (example: 2023-01-01):"
read REF_DATE

ref_epoch=$(date -jf "%Y-%m-%d" "$REF_DATE" +%s)
current_epoch=$(date +%s)

echo "Recently modified files in $DIRECTORY and its subdirectories (excluding directories starting with .), sorted by oldest first:"

find "$DIRECTORY" -type f -not -path "*/.*/*" -print0 |
  xargs -0 stat -f "%m %N" |
  sort -n |
  awk -v ref_epoch="$ref_epoch" -v current_epoch="$current_epoch" 'BEGIN {
    printf("\033[1;37m%-10s %-10s %5s %-12s %-5s %s\033[0m\n", "Type", "Permissions", "Size", "Date", "Time", "Name");
}
{
    file_epoch = $1;
    file_path = $2;
    # 1ヶ月を秒で計算
    one_month_sec = 30 * 24 * 60 * 60;
    if (file_epoch < ref_epoch) {
        color = "\033[31m"; # 赤色で表示
    } else if (current_epoch - file_epoch < one_month_sec) {
        color = "\033[32m"; # 緑色で表示
    } else {
        color = "\033[37m"; # 通常の白色で表示
    }
    system("stat -f \"%Sp %z %Sm %N\" -t \"%Y-%m-%d %H:%M:%S\" " file_path " | awk -v color='\''" color "'\'' '\''{printf(color \"%-10s %-10s %5s %-12s %-5s %s\\033[0m\\n\", $1, $2, $3, $4, $5, $6);}'\''");
}'