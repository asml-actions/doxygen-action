#!/bin/sh

# execute doxygen
# $1 is the path to the Doxyfile
# $2 is the directory where doxygen should be executed
# $3 is a boolean: true -> enable latex generation, false -> skip latex generation
# $4 is a string with extra alpine packages to be installed (i.e. font-fira-code)

if [ ! -d $2 ]; then
  echo "Path $2 could not be found!"
  exit 1
fi
cd $2

if [ ! -f $1 ]; then
  echo "File $1 could not be found!"
  exit 1
fi

# install packages; add latex-related packages only if enabled
if [ ! -z $3 ] ; then
  BUILD_LATEX=$3 && $(grep -q GENERATE_LATEX\\s\*=\\s\*YES $1)
  LATEX_DIR="./$(sed -n -e 's/^OUTPUT_DIRECTORY\s*=\s*//p' $1)/$(sed -n -e 's/^LATEX_OUTPUT\s*=\s*//p' $1)"
else
  BUILD_LATEX=0
fi

if [ ! -z $4 ]; then
  apk add $4
fi

# run "regular" doxygen
doxygen $1

# if enabled, make latex pdf output
if [ "$BUILD_LATEX" = true ] ; then
  cd $LATEX_DIR
  make
fi
