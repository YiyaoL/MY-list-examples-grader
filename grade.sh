CPATH=".:../lib/hamcrest-core-1.3.jar:../lib/junit-4.13.2.jar"
rm -rf student-submission
git clone $1 student-submission

if [ -e student-submission/ListExamples.java ]; then
    cp TestListExamples.java student-submission
    cd student-submission
    echo "copied TestListExamples.java"
else
    echo "file doesn't exist"
    exit 1
fi

javac -cp $CPATH *.java
if [ $? -eq 0 ]; then
    echo "Compiled."
else
    echo "Failed to compile..."
    echo $?
    exit 1
fi

echo "Running tests..."
java -cp $CPATH org.junit.runner.JUnitCore TestListExamples > testout.txt
echo "Test output:"
grep -i "test" testout.txt