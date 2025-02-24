#!/bin/bash

# Find PDF files in the specified directories
PDF_FILES=$(find ~/ ~/uni/ ~/uni/bachelor-1/ ~/uni/bachelor-1/semester-1/ ~/uni/bachelor-1/semester-2/ ~/Documents/ -type f -name "*.pdf" -not -path "*/.local/*" -not -path "*/.cache/*")

if [ -z "$PDF_FILES" ]; then
    rofi -e "No PDF files found in the specified directories"
    exit 1
fi


# Use Rofi to select a PDF file
CHOSEN_FILE=$(echo "$PDF_FILES" | rofi -dmenu -p "Select PDF" -matching fuzzy)

if [ -z "$CHOSEN_FILE" ]; then
    exit 1
fi

# Open the selected PDF file with Zathura
zathura "$CHOSEN_FILE"
