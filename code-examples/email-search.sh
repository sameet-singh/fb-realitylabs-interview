#!/bin/bash
#----------------------------------------------------------------------------------------\
# Purpose: Supplemental Materials for Facebook Reality Labs DevOps Engineer Interview
#			-Interview Question: 
#				"How do you find all occurrences of e-mail addresses
#				in text files within a given directory in Linux?"
#
# Description: Native one-liner solution using grep, sort, and uniq 
#
# Usage: email-search-native.sh [target directory]
# Example: ./email-search-native.sh ./email-search-dir
#
# Author: Sameet Singh (sameet.singh@outlook.com)
# Date: 09/25/2020
#----------------------------------------------------------------------------------------/

grep -Eiorh '([[:alnum:]_.-]+@[[:alnum:]_.-]+?\.[[:alpha:].]{2,6})' "$@" * | sort | uniq
