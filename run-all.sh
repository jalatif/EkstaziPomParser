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

./run_ekstazi.sh https://github.com/JodaOrg/joda-time.git joda
read -r -p "Do you want to continue and run ekstazi_parser on next project? [y/N] " response
checkKey "$response"

./run_ekstazi.sh http://svn.apache.org/repos/asf/commons/proper/collections/trunk commons-col
read -r -p "Do you want to continue and run ekstazi_parser on next project? [y/N] " response
checkKey "$response"

./run_ekstazi.sh http://svn.apache.org/repos/asf/commons/proper/math/trunk/ commons-math
read -r -p "Do you want to continue and run ekstazi_parser on next project? [y/N] " response
checkKey "$response"

./run_ekstazi.sh https://github.com/google/closure-compiler.git closure

read -r -p "Do you want to continue and run ekstazi_parser on next project? [y/N] " response
checkKey "$response"

################ List of Other Projects Not Supported #########################
################ You can uncomment these lines to run these projects

#./run_ekstazi.sh https://github.com/cucumber/cucumber-jvm.git cucumber
#read -r -p "Do you want to continue and run ekstazi_parser on next project? [y/N] " response
#checkKey "$response"

#./run_ekstazi.sh http://svn.apache.org/repos/asf/chukwa/trunk/ chukwa
#read -r -p "Do you want to continue and run ekstazi_parser on next project? [y/N] " response
#checkKey "$response"
################################################################################

echo "There are currently no other projects to run with this script."
