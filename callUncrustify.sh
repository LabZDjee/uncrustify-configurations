#!/bin/bash
# executes uncrustify in the current folder on all .c and .h files
# only updates files which differ after the operation (avoiding tampering with file timestamps)

# parameters (for path specification, for instance)
UNCRUSTIFY_APP="uncrustify"
CONFIGURATION_FILE="uncrustify.cfg"

# variables
TEMP_FILE="___uncrustify_output___.tmp"
SILENT=0
SINGLE_FILE=""

# process parameters
for i
do
 case "$i" in
  -q|--quiet)
   SILENT=1
   ;;
  --help)
   echo 'uncrustify on .c and .h C files in the current folder'
   echo ' only modifed files are rewritten'
   echo 'optional parameters:'
   echo ' -q --quiet: does not display anything'
   echo ' <file>: uncrustify a single <file> instead all C files'
   exit
   ;;
  *)
   SINGLE_FILE=$i
   ;;
 esac
done

# potential redirection of stdout
if [[ ${SILENT} -eq 1 ]]
then
 exec 1>/dev/null
fi

# the actual job
function doUncrust() {
 ${UNCRUSTIFY_APP} -f $1 -c ${CONFIGURATION_FILE} -o ${TEMP_FILE} >/dev/null 2>&1
 diff --brief $1 ${TEMP_FILE} >/dev/null 2>&1
 if [[ $? -eq 0 ]]
 then
  rm ${TEMP_FILE} 
 else
  echo $1 UNCRUSTIFIED! 2>&1
  mv ${TEMP_FILE} $1
 fi
}

if [[ -z ${SINGLE_FILE} ]]
then
 for FILE in *.c *.h
 do
  doUncrust ${FILE}
 done
else
 doUncrust ${SINGLE_FILE}
fi
