#!/bin/sh

#################### ADD default keychain with certificates ####################
echo "Create a custom keychain"
security create-keychain -p ci ios-build.keychain

echo "Make the custom keychain default, so xcodebuild will use it for signing"
security default-keychain -s ios-build.keychain

echo "Unlock the keychain"
security unlock-keychain -p ci ios-build.keychain

echo "Set keychain timeout to 1 hour for long builds"
# see http://www.egeek.me/2013/02/23/jenkins-and-xcode-user-interaction-is-not-allowed/
security set-keychain-settings -t 3600 -l ~/Library/Keychains/ios-build.keychain

echo "Add certificates to keychain and allow codesign to access them"
security import ./scripts/certs/apple.cer -k ~/Library/Keychains/ios-build.keychain -A /usr/bin/codesign
security import ./scripts/certs/dist.cer -k ~/Library/Keychains/ios-build.keychain -A /usr/bin/codesign
security import ./scripts/certs/dist.p12 -k ~/Library/Keychains/ios-build.keychain -P $P12_SECRET -A /usr/bin/codesign
# Some MAGIC (TODO INVESTIGATE) which helps to NOT hangs the codesign
security set-key-partition-list -S apple-tool:,apple: -s -k ci ios-build.keychain

echo "Put the provisioning profile in place"
mkdir -p ~/Library/MobileDevice/Provisioning\ Profiles
cp "./scripts/profile/UnitTestRepoAppAdHocCI.mobileprovision" ~/Library/MobileDevice/Provisioning\ Profiles/



#################### BUILD ARCHIVE ####################
echo "Archive"
xcodebuild -workspace ./UnitTestWithPodAPP.xcworkspace -scheme UnitTestWithPodAPP -sdk iphoneos -configuration Release archive -archivePath ./build/UnitTestWithPodAPP.xcarchive
echo "Create IPA and sign"
xcodebuild -exportArchive -archivePath ./build/UnitTestWithPodAPP.xcarchive -exportOptionsPlist ./scripts/exportOptions.plist -exportPath ./build



#################### Uploading application to Firebase ####################
echo "Install firebase CLI"
npm install -g firebase-tools

echo "Upload to Firebase"
commit_message=$(git log -1 --pretty=%B)
date=$(TZ=":Europe/Amsterdam" date +"%d-%m-%Y %H:%M:%S")
release_notes="Log: $commit_message\nBuild date: $date"
echo "relase_notes = $release_notes"

firebase appdistribution:distribute  ./build/UnitTestWithPodAPP.ipa  \
  --app "$FIREBASE_APP_ID"  \
  --release-notes "$release_notes" \
  --groups "$GROUPS_LIST" \
  --token "$FIREBASE_TOKEN"