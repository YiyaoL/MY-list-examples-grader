CPATH=".:../lib/hamcrest-core-1.3.jar:../lib/junit-4.13.2.jar"

rm -rf student-submission
git clone $1 student-submission
cp TestListExamples.java student-submission/

if [[ -e student-submission/ListExamples.java ]]
then
    echo "File exists!"
else
    echo "File not found. Please try again."
    exit 1
fi

cd student-submission

javac -cp $CPATH *.java 
if [ $? -eq 0 ]; then
    echo "Compiled Successfully!"
else
    echo "Failed to compile. Please try again."
    exit 1
fi

echo "Begin running tests."

java -cp $CPATH org.junit.runner.JUnitCore TestListExamples
echo "Test output:"
grep -i "test" testout.txt 
cat testout.txt