#!/bin/bash
# Getting commandline arguments
inputFile=$1 
age=$2

# redirecting our sed file and passing our arguments
bash redaction.sed $inputFile $age
