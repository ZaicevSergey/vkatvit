#!/bin/bash
FILE=D:\\curse\\HW1\\src\\main\\java\\Main.java
FILE_CLASS=D:\\curse\\HW1\\src\\main\\java\\Main.class
myFileSizeCheck=$(stat -c %s "$FILE")


if [[ -f "$FILE" ]] && [[ "$myFileSizeCheck" -gt 100 ]]; then
  echo "$FILE $(date +"%d-%m-%Y") $(date +"%T") <---- The file was found and its size in bytes is : $myFileSizeCheck" >>error.log
  javac Main.java
  if [ -f "$FILE_CLASS" ]; then
    echo "$FILE $(date +"%d-%m-%Y") $(date +"%T") <---- File compiled" >>error.log
    echo "$FILE_CLASS $(date +"%d-%m-%Y") $(date +"%T") <---- Running the application" >>error.log
    java Main myParam
  else
    echo "$FILE $(date +"%d-%m-%Y") $(date +"%T") <---- The file is not compiled" >>error.log
  fi
else
  echo "$FILE <---- File not found or its size does not match the condition. Compilation is not possible" >>error.log
fi
