#!/bin/bash

cwd=`pwd`

if [ -z "$1" ]; then
	echo "No argument supplied. Please run the program as ./run_ekstazi.sh {git|svn}_project_url [local_folder_name] [ekstazi_version]"
	echo "Arguments in [] are optional."
	exit 0
fi

project_url=$1
project="mvn_test_project"
version="3.4.2"
git_project="0"

rm -rf ${project}

if [ ! -z "$2" ]; then
	project=$2
fi

if [ ! -z "$3" ]; then
	version=$3
fi

if [ ! -d "${project}" ]; then

	protocol=`echo $project_url | cut -d':' -f 2`
	git_project_url="git:${protocol}"
	#echo $protocol
	#echo $git_project_url

	git_project=`timeout 2 git ls-remote $git_project_url | wc -l | tail -1 | awk '{if ($1 > 0) {print "0"} else {print "1"}}'`

	if [ $git_project -eq "0" ]; then
		echo "A Git project"
		git clone ${project_url} ${project}
	else
		echo "Not a git project"
		echo "Try if it's an svn project"
		svn co ${project_url} ${project}
	fi
else
	rm -rf ${project}/.ekstazi
fi

## Check if clone was good
if [ ! -d "${project}" ]; then
       echo "Nothing was cloned. Check if the url is valid git or svn url."
       exit 1
fi

cd ${project}

rm -rf pom.xml

if [ $git_project -eq "0" ]; then
	git checkout pom.xml
	git checkout
else	
	svn up
fi

# Download Ekstazi
url="mir.cs.illinois.edu/gliga/projects/ekstazi/release/"
if [ ! -e org.ekstazi.core-${version}.jar ]; then wget "${url}"org.ekstazi.core-${version}.jar; fi
if [ ! -e org.ekstazi.ant-${version}.jar ]; then wget "${url}"org.ekstazi.ant-${version}.jar; fi
if [ ! -e ekstazi-maven-plugin-${version}.jar ]; then wget "${url}"ekstazi-maven-plugin-${version}.jar; fi

# Install Ekstazi
mvn install:install-file -Dfile=org.ekstazi.core-${version}.jar -DgroupId=org.ekstazi -DartifactId=org.ekstazi.core -Dversion=${version} -Dpackaging=jar -DlocalRepositoryPath=$HOME/.m2/repository/
mvn install:install-file -Dfile=ekstazi-maven-plugin-${version}.jar -DgroupId=org.ekstazi -DartifactId=ekstazi-maven-plugin -Dversion=${version} -Dpackaging=jar -DlocalRepositoryPath=$HOME/.m2/repository/

java -jar ../pom_parser.jar . "${version}"	
../test_ekstazi.sh .
