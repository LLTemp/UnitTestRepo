rm -rf test_sic_zip
git clone https://github.com/LLTemp/test_sic_zip.git
mv UnitTestWithPod.framework.zip test_sic_zip
cp UnitTestWithPod.podspec test_sic_zip
cd test_sic_zip
ls -la
git add .
git commit -m "up"
git status
git push https://LLTemp:$push_token@github.com/LLTemp/test_sic_zip.git
