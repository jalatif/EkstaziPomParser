#!/bin/bash

dir_name="Ekstazi_Testing_Temp"

function checkKey() {
	prompt="$1"
	if [[ $prompt == "y" || $prompt == "Y" || $prompt == "yes" || $prompt == "Yes" ]]
	then
		return
	else
	  echo "Execution of projects will stop now."
	  exit 0
	fi

}

if [ -d "${dir_name}" ]; then
       echo "Files already cloned"
else
	git clone https://github.com/sharma55-umehrot2/EkstaziPomParser ${dir_name}
fi

cd ${dir_name}

chmod +x *.sh

read -r -p "Do you want to continue and run ekstazi_parser on next project? [y/N] " response
checkKey "$response"

./run_ekstazi.sh -u "https://github.com/JodaOrg/joda-time.git" -p "joda"
read -r -p "Do you want to continue and run ekstazi_parser on next project? [y/N] " response
checkKey "$response"

./run_ekstazi.sh -u "http://svn.apache.org/repos/asf/commons/proper/lang/trunk" -p "commons-lang"
read -r -p "Do you want to continue and run ekstazi_parser on next project? [y/N] " response
checkKey "$response"

./run_ekstazi.sh -u "http://svn.apache.org/repos/asf/commons/proper/collections/trunk" -p "commons-col"
read -r -p "Do you want to continue and run ekstazi_parser on next project? [y/N] " response
checkKey "$response"

./run_ekstazi.sh -u "http://svn.apache.org/repos/asf/commons/proper/math/trunk/" -p "commons-math"
read -r -p "Do you want to continue and run ekstazi_parser on next project? [y/N] " response
checkKey "$response"

./run_ekstazi.sh -u "http://svn.apache.org/repos/asf/commons/proper/configuration/trunk" -p "commons-config"
read -r -p "Do you want to continue and run ekstazi_parser on next project? [y/N] " response
checkKey "$response"

./run_ekstazi.sh -u "https://github.com/google/closure-compiler.git" -p "closure"
read -r -p "Do you want to continue and run ekstazi_parser on next project? [y/N] " response
checkKey "$response"

./run_ekstazi.sh -u "https://code.google.com/p/guava-libraries/" -p "guava" -m "guava-tests"
read -r -p "Do you want to continue and run ekstazi_parser on next project? [y/N] " response
checkKey "$response"

./run_ekstazi.sh -u "https://github.com/cucumber/cucumber-jvm.git" -p "cucumber" -v "4.2.0"
read -r -p "Do you want to continue and run ekstazi_parser on next project? [y/N] " response
checkKey "$response"

patch run_ekstazi.sh < patch_jgit.txt
./run_ekstazi.sh -u "https://git.eclipse.org/r/p/jgit/jgit.git" -p "jgit" -v "4.2.0" -s "2.18"
patch -R run_ekstazi.sh < patch_jgit.txt
read -r -p "Do you want to continue and run ekstazi_parser on next project? [y/N] " response
checkKey "$response"

./run_ekstazi.sh -u "https://github.com/netty/netty/" -p "netty" -s "2.15"
read -r -p "Do you want to continue and run ekstazi_parser on next project? [y/N] " response
checkKey "$response"

patch run_ekstazi.sh < patch_log4j.txt
./run_ekstazi.sh -u "http://svn.apache.org/repos/asf/logging/log4j/trunk/" -p "log4j" -v "4.2.0" -s "2.15"
patch -R run_ekstazi.sh < patch_log4j.txt
read -r -p "Do you want to continue and run ekstazi_parser on next project? [y/N] " response
checkKey "$response"


./run_ekstazi.sh -u "http://svn.apache.org/repos/asf/commons/proper/pool/trunk" -p "pool"
read -r -p "Do you want to continue and run ekstazi_parser on next project? [y/N] " response
checkKey "$response"

./run_ekstazi.sh -u "https://github.com/zxing/zxing.git"  -p "zxing" -s "2.18"
read -r -p "Do you want to continue and run ekstazi_parser on next project? [y/N] " response
checkKey "$response"

./run_ekstazi.sh -u "https://github.com/apache/phoenix"  -p "phoenix" -s "2.16"
read -r -p "Do you want to continue and run ekstazi_parser on next project? [y/N] " response
checkKey "$response"

./run_ekstazi.sh -u "http://svn.apache.org/repos/asf/gora/trunk/" -p "gora" -s "2.15"
read -r -p "Do you want to continue and run ekstazi_parser on next project? [y/N] " response
checkKey "$response"

patch run_ekstazi.sh < patch_gs.txt
./run_ekstazi.sh -u "https://github.com/goldmansachs/gs-collections.git" -p "gsachs" -s "2.15" -v "3.4.2" -m "collections-testutils,gs-collections-code-generator,jmh-scala-tests,jmh-tests,gs-collections-code-generator-ant,gs-collections-code-generator-maven-plugin,collections-api,gs-collections-forkjoin,serialization-tests,memory-tests"
patch -R run_ekstazi.sh < patch_gs.txt
read -r -p "Do you want to continue and run ekstazi_parser on next project? [y/N] " response
checkKey "$response"

./run_ekstazi.sh -u "http://svn.apache.org/repos/asf/chukwa/trunk/" -p "chukwa" -s "2.13"
read -r -p "Do you want to continue and run ekstazi_parser on next project? [y/N] " response
checkKey "$response"

################ List of Other Projects Not Supported #########################
################ You can uncomment these lines to run these projects

################################################################################

echo "There are currently no other projects to run with this script."


