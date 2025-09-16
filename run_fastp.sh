#!/bin/bash

# Check if ID is provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 <Sample_ID>"
    exit 1
fi

ID=$1

# Run fastp with dynamic sample ID
fastp \
  -i data/${ID}_1.fastq -I data/${ID}_2.fastq \
  -o trimmed/${ID}_1.trim2.fastq -O trimmed/${ID}_2.trim2.fastq \
  --detect_adapter_for_pe \
  -q 30 -u 20 -l 35 \
  -w 8 \
  -h qc_reports/${ID}_fastp.html \
  -j qc_reports/${ID}_fastp.json

