#!/bin/bash

in_message=false
message=""

echo $TERM

while read line ; do
    if [[ "$line" =~ Warning|Message|Error ]]
    then
        in_message=true
        message="$line"
        if [[ "$line" =~ Warning ]] ; then
            color=1
        fi
        if [[ "$line" =~ Message ]] ; then
            color=2
        fi
        if [[ "$line" =~ Error ]] ; then
            color=3
        fi
    else
        if [[ $in_message == true ]] ; then
            message="$message$line"
        fi
    fi
    if [[ "$line" == "" ]]
    then
        in_message=false
        echo -e "$(tput setaf $color)$message$(tput sgr0)"
        message=""
    fi
done
