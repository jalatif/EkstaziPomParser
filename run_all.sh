#!/bin/bash

#./run_ekstazi.sh -u "https://code.google.com/p/guava-libraries/" -p "guava" -m "guava-tests"
#./run_ekstazi.sh -u "https://github.com/cucumber/cucumber-jvm.git" -p "cucumber" -v "4.2.0"

patch run_ekstazi.sh < patch_jgit.txt
./run_ekstazi.sh -u "https://git.eclipse.org/r/p/jgit/jgit.git" -p "jgit" -v "4.2.0" -s "2.18"
patch -R run_ekstazi.sh < patch_jgit.txt
