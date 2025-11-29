#!/bin/bash
set -e

INPUT_FILE="data/ds000102/sub-01/anat/sub-01_T1w.nii.gz"
OUTPUT_FILE="data/ds000102/sub-01/anat/sub-01_T1w_brain.nii.gz"

if [ ! -f "$INPUT_FILE" ]; then
    echo "Input file not found: $INPUT_FILE"
    exit 1
fi

echo "Running FSL BET (skull stripping)..."
bet "$INPUT_FILE" "$OUTPUT_FILE" -f 0.5 -g 0
echo "Done! Output saved as $OUTPUT_FILE"
