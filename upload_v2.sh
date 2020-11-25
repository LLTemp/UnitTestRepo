rm -rf test_sic_zip
git clone https://github.com/LLTemp/test_sic_zip.git
mv UnitTestWithPod.framework.zip test_sic_zip
cd test_sic_zip
git add .
git commit -m "up"
git push --repo=https://github.com/LLTemp/test_sic_zip.git
