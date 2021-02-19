#!/bin/sh


##################################
echo "Set environment variables"
SDK_NAME="UnitTestWithPod.framework"
VERSION=$(<VERSION)
ARTEFACT="$SDK_NAME"
BUCKET="testbuildartefacts"
ARTEFACT_NAME="sic-sdk-ios/${VERSION}/${SDK_NAME}.zip"
AWS_DEFAULT_REGION="us-east-2"

echo "Sdk name = ${SDK_NAME}"
echo "Version = $VERSION"
echo "Artefact = $ARTEFACT"
echo "Bucket = $BUCKET"
echo "Artefact name = $ARTEFACT_NAME"
echo "Default region = $AWS_DEFAULT_REGION"


##################################
echo "Build SDK"
xcodebuild -workspace ./UnitTestWithPod.xcworkspace -scheme UniversalSim-Arm64-X86_64 ONLY_ACTIVE_ARCH=YES CODE_SIGN_REQUIRE=NO


###################################
echo "Zip SDK"
zip -r "./${SDK_NAME}.zip" ./${SDK_NAME}


###################################
echo "Update VERSIONs"
/usr/libexec/PlistBuddy -c "Set :CFBundleShortVersionString $VERSION" "./UnitTestWithPod/Info.plist"
sed -E -i '' -e "s/[0-9]{1,}.[0-9]{1,}.[0-9]{1,}/${VERSION}/" UnitTestWithPod.podspec
sed -E -i '' -e "s#spec.source.*#spec.source = { :http => \"https://${BUCKET}.s3.${AWS_DEFAULT_REGION}.amazonaws.com/${ARTEFACT_NAME}\" }#g" UnitTestWithPod.podspec

# variable to get region AWS_DEFAULT_REGION
# eu-central-1

###################################
echo "Deploy SDK"

md5=`/usr/bin/openssl dgst -md5 -binary "${ARTEFACT}.zip" | /usr/bin/openssl enc -base64`
echo "Deploying to $BUCKET/${ARTEFACT_NAME} Md5 = ${md5}"

aws s3api put-object \
  --bucket "$BUCKET" \
  --key "${ARTEFACT_NAME}" \
  --body "${PWD}/${ARTEFACT}.zip" \
  --content-md5 "$md5"
