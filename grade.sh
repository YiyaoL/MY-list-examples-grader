# Create your grading script here

set -e

CPATH=".:../lib/hamcrest-core-1.3.jar:../lib/junit-4.13.2.jar"

rm -rf student-submission
git clone $1 student-submission

if ! [[ -e student-submission/ListExamples.java ]]
then 
    echo "file doesn't exist"
    exit 1
else
    cp TestListExamples.java ./student-submission/
    echo "copied TestListExamples.java"
    javac -cp ".;lib/hamcrest-core-1.3.jar;lib/junit-4.13.2.jar" *.java
    echo "compiled"
fi

javac -cp $CPATH *.java
java -cp $CPATH org.junit.runner.JUnitCore TestListExamples2 > testout.txt
echo "Report:"

if [[ $? -eq 0 ]]
then 
  echo "OK"
  exit 0
else
  echo "Test failed. Please try again."
  cat testout.txt
  exit 1
fi