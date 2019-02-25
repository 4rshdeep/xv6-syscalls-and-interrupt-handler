cd ..
mkdir -p temp_test
cp tests/* temp_test
cp src/* temp_test
cd temp_test
bash ./check.sh
cd ..
rm -rf temp_test