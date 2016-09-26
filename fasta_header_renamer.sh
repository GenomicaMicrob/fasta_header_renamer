#!/bin/bash
# Author: Bruno Gomez-Gil, Laboratorio de Genomica Microbiana, CIAD.
# Last revised: 25 Sept 2016
# This script renames the headers of a multifasta file with the file name and adds a consecutive number to each sequence.
# Usage: fasta_header_renamer fasta_file
echo ____________________________________________________________________________________
display_usage(){
	echo
	echo -e "\e[1mERROR\e[0m: missing filename"
	echo "USAGE: fasta_header_renamer.sh fasta_file"
	echo
echo ____________________________________________________________________________________
}
# if less than one arguments supplied, display usage 
	if [  $# -le 0 ] 
	then 
		display_usage
		exit 1
	fi
	
# Script starts
echo
echo Script to rename the headers of a mutifasta file with the name of the file;
echo it also adds a consecutive number to each sequence header.
echo It will produce a new file with the extension fna in the subdirectory renamed_files/.
echo
	mkdir -p renamed_files
	BASENAME=$(echo $1 | rev | cut -f 2- -d '.' | rev) # variable to extract the name of file without the extension.
	awk '/^>/{print ">'$BASENAME'_"++i; next}{print}' $1 > renamed_files/$BASENAME.fna # adds a _ and a consecutive number to the new sequence header.
	SEQS=$(grep -c ">" renamed_files/$BASENAME.fna) # counts the number of sequences in the file
echo -e "The file \e[1m$BASENAME.fna\e[0m was created and contains \e[1m$SEQS\e[0m sequences."
echo ____________________________________________________________________________________
echo
# This is the end.
