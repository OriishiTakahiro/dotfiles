#!/bin/sh

set -xe
apps=`ls -d */ | sed 's/\///'`
stow $apps -t ~/
