CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'

if [[ -f student-submission/ListExamples.java ]]
then
    correct_filename=true
    echo  'Correct File Submitted.'
else
    correct_filename=false
    echo 'The correct file 'ListExamples.java' was not found. Please check that the naming is correct or that the file was submitted.'
    exit
fi
cp student-submission/ListExamples.java TestListExamples.java grading-area
cp -r lib grading-area

cd grading-area

javac -cp $CPATH ListExamples.java TestListExamples.java 2> results.txt

if [[ $? -eq 0 ]]
then
    compiled=true
    echo 'The file has compiled successfully.'
else
    compiled=false
    echo 'The file did not compile successfully. Please check for compile errors and resubmit.'
    exit
fi

# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests
