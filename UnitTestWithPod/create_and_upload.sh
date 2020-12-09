#!/bin/sh

###################################
echo "Build SDK"
xcodebuild -workspace ./UnitTestWithPod.xcworkspace -scheme Universal ONLY_ACTIVE_ARCH=YES CODE_SIGN_REQUIRE=NO


###################################
echo "Get SDK semantic version"
version=$(<VERSION)
sdkName="UnitTestWithPod-${version}.framework.zip"
echo "Sdk name = ${sdkName}"


###################################
echo "Zip ADK"
zip -r "./${sdkName}" ./UnitTestWithPod.framework

###################################
echo "Update versions"
version=$(<VERSION)
echo "Version = $version"
/usr/libexec/PlistBuddy -c "Set :CFBundleShortVersionString $version" "./UnitTestWithPod/Info.plist"
sed -E -i '' -e "s/[0-9]{1,}.[0-9]{1,}.[0-9]{1,}/${version}/" UnitTestWithPod.podspec
sed -E -i '' -e "s#spec.source.*#spec.source = { :http => \"https://github.com/LLTemp/test_sic_zip/raw/main/$sdkName\" }#g" UnitTestWithPod.podspec


###################################
echo "Upload SDK"
rm -rf test_sic_zip
git clone https://github.com/LLTemp/test_sic_zip.git
mkdir "./test_sic_zip/$version"
mv "${sdkName}" "./test_sic_zip/$version"
cp UnitTestWithPod.podspec "./test_sic_zip/$version"
cd test_sic_zip
ls -la
git add .
git commit -m "Version $sdkName"
git tag "SDK_IOS_$sdkName"
git status
git push https://LLTemp:$push_token@github.com/LLTemp/test_sic_zip.git
