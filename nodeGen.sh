#!/bin/bash

# Init the variables
TARGET=$1
SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
TARGETPATH="$SCRIPTPATH/generation/$TARGET"
CONTENTPATH="$SCRIPTPATH/generation/$TARGET/src"
ROOTPATH="$SCRIPTPATH/generation/$TARGET/root"
PREGENFILE="$TARGETPATH/pre-generation.sh"
POSTGENFILE="$TARGETPATH/post-generation.sh"
DESTINATIONROOT="."
DESTINATIONSRC="./src"
GITURL=git@github.com:Node-Generator/$TARGET.git

# Check if there is a target
[ ! $TARGET ] && echo "Error: You need to specify a target as first argument." && exit 1;
[ $TARGET == "Node-Generator" ] && echo "Error: You can't generate the generator." && exit 1;

# Get the latest version of the repository
rm -rf $TARGETPATH
git clone $GITURL $TARGETPATH

# Check if the local directory of the target exist
[ ! -d $TARGETPATH ] && echo "Error: Directory $TARGETPATH DOES NOT exist." && exit 1;

# # Check if there is a content or root folder to copy
[ ! -d $CONTENTPATH ] && [ ! -d $ROOTPATH ] && echo "Error: Directory $TARGET DOES NOT have any src or root to copy." && exit 1;


echo "Generating \"$1\""
# # Change to execution mode the preGen file and run it
[ -f $PREGENFILE ] && chmod +x $PREGENFILE && $PREGENFILE;

# # Copy the content and the root to the destination
cp -Ra "$CONTENTPATH/." $DESTINATIONSRC
cp -Ra "$ROOTPATH/." $DESTINATIONROOT

# # Change to execution mode the postGen file and run it
[ -f $POSTGENFILE ] && chmod +x $POSTGENFILE && $POSTGENFILE;
echo "\"$TARGET\" Generated!"
# 