#! /bin/sh

find . -name '*.tex' -exec sed -i -e 's/ţ/ț/g' -e 's/ş/ș/g' -e 's/Ţ/Ț/g' -e 's/Ş/Ș/g' {} \;
