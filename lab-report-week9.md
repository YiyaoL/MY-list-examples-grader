# Lab Report 5

1. grade.sh code
```
CPATH=".;lib/hamcrest-core-1.3.jar;lib/junit-4.13.2.jar"
rm -rf student-submission
git clone $1 student-submission
cp -r lib student-submission

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
```

2. Result from three submissions

My code doesn't work for the browser interface because of the naming error I mentioned in 
First, make sure your grading script from Lab 7 can successfully give feedback on all of the sample student submissions. You might make some judgment calls about which ones get “credit” or not! But there should be something meaningfully reported for all of them. You should confirm that this works through the browser interface as well as the command line.

To demonstrate this, include in your lab report:

    Your grade.sh in a code block
    Screenshots of three different student submissions and their reported grade as loaded in the browser (URL like https://localhost:4000/grade?repo=https://github.com...)

Then, choose one of the examples you showed in screenshot, and describe a trace of what your grade.sh does on that example.

To trace the script, describe:

    For each line with a command, what its standard output and standard error are for this run, and whether its return code was zero or nonzero
    For each line with an if statement, whether the condition was true or false, and why
    Indicate each line that does not run (maybe because it is in an if branch that doesn’t evaluate, or after an early exit)