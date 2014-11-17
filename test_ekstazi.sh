#!/bin/bash

cd $1

rm -rf .ekstazi/

trun1=`mvn test -fae | tee /dev/tty | awk '/Results :/{y=1;next}y'| grep -i "Tests run: " | awk '{print $3}' | cut -d',' -f 1`

trun2=`mvn test -fae | tee /dev/tty | awk '/Results :/{y=1;next}y'| grep -i "Tests run: " | awk '{print $3}' | cut -d',' -f 1`

if [ -z "$trun1" ]
then
	trun1=0
	echo "Some problem in running tests"
	exit 0
fi

if [ -z "$trun2" ]
then
	trun2=0
fi

echo ""
echo "Number of tests that ran first time = " $trun1
echo "Number of tests that ran second time = " $trun2
echo ""

tdiff=`expr ${trun1} - ${trun2}`

echo "Difference of testcases that ran = " $tdiff

if [ $tdiff -eq $trun1 ]
then
	echo "Tests reduced 100% successfully"
elif [ $tdiff -gt 0 ]
then
	echo "Some of the tests were reduced by ekstazi."
elif [ $tdiff -eq 0 ]
then	
	echo "Ekstazi didn't ran successfully. Check pom configuration again."
else
	echo "Something wrong here. Check pom configuration again."
fi

