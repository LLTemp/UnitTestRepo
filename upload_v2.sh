rm -rf test_sic_zip
git clone https://github.com/LLTemp/test_sic_zip.git
mv UnitTestWithPod.framework.zip test_sic_zip
cd test_sic_zip
git add .
git commit -m "up"
git push https://LLTemp:2a9f49eac916d298408984ae7edaca903fd8df5d@github.com/LLTemp/test_sic_zip.git
