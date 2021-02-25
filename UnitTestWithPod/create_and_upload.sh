#!/bin/sh


##################################
echo "Set environment variables"
PODSPEC_NAME="UnitTestWithPod.podspec"
SDK_NAME="UnitTestWithPod.xcframework"
VERSION=$(<VERSION)
ARTEFACT="$SDK_NAME"
BUCKET="testbuildartefacts"
ARTEFACT_NAME_BINARY="sic-sdk-ios/${VERSION}/${SDK_NAME}.zip"
ARTEFACT_NAME_PODSPEC="sic-sdk-ios/${VERSION}/${PODSPEC_NAME}"
AWS_DEFAULT_REGION="us-east-2"

echo "Sdk name = ${SDK_NAME}"
echo "Version = $VERSION"
echo "Artefact = $ARTEFACT"
echo "Bucket = $BUCKET"
echo "Artefact name = $ARTEFACT_NAME_BINARY"
echo "Default region = $AWS_DEFAULT_REGION"



##################################
echo "Build SDK"
#xcodebuild -workspace ./UnitTestWithPod.xcworkspace -scheme UniversalSim-Arm64-X86_64 ONLY_ACTIVE_ARCH=YES CODE_SIGN_REQUIRE=NO


###################################
echo "Zip SDK"
cd ./build/
zip -r "../${SDK_NAME}.zip" ./UnitTestWithPod.xcframework || exit 2
cd ..



##################################
echo "Update VERSIONs"
/usr/libexec/PlistBuddy -c "Set :CFBundleShortVersionString $VERSION" "./UnitTestWithPod/Info.plist"
sed -E -i '' -e "s#spec.version.*#spec.version = \"${VERSION}\"#g" "${PODSPEC_NAME}"


###################################
echo "Deploy SDK"

md5_binary=`/usr/bin/openssl dgst -md5 -binary "${ARTEFACT}.zip" | /usr/bin/openssl enc -base64`
echo "Deploying to $BUCKET/${ARTEFACT_NAME_BINARY} Md5 = ${md5_binary}"

# upload binary
aws s3api put-object \
  --bucket "$BUCKET" \
  --key "${ARTEFACT_NAME_BINARY}" \
  --body "${PWD}/${ARTEFACT}.zip" \
  --content-md5 "$md5_binary"

# upload *.podspec
md5_podspec=`/usr/bin/openssl dgst -md5 -binary "${PODSPEC_NAME}" | /usr/bin/openssl enc -base64`
echo "Deploying to $BUCKET/${ARTEFACT_NAME_PODSPEC} Md5 = ${md5_podspec}"
aws s3api put-object \
  --bucket "$BUCKET" \
  --key "${ARTEFACT_NAME_PODSPEC}" \
  --body "${PWD}/${PODSPEC_NAME}" \
  --content-md5 "$md5_podspec"


