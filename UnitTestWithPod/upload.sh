rm -rf test_sic_zip
git clone https://github.com/LLTemp/test_sic_zip.git
mv UnitTestWithPod.framework.zip test_sic_zip
cp SDK.podspec test_sic_zip
cd test_sic_zip
git add .
git commit -m "up"
git push https://LLTemp:$push_token@github.com/LLTemp/test_sic_zip.git
