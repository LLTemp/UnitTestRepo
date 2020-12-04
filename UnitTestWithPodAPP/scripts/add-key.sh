#!/bin/sh

# Create a custom keychain
security create-keychain -p ci ios-build.keychain

# Make the custom keychain default, so xcodebuild will use it for signing
security default-keychain -s ios-build.keychain

# Unlock the keychain
security unlock-keychain -p ci ios-build.keychain

# Set keychain timeout to 1 hour for long builds
# see http://www.egeek.me/2013/02/23/jenkins-and-xcode-user-interaction-is-not-allowed/
security set-keychain-settings -t 3600 -l ~/Library/Keychains/ios-build.keychain

# Add certificates to keychain and allow codesign to access them
security import ./certs/apple.cer -k ~/Library/Keychains/ios-build.keychain -A /usr/bin/codesign
security import ./certs/dist.cer -k ~/Library/Keychains/ios-build.keychain -A /usr/bin/codesign
security import ./certs/dist.p12 -k ~/Library/Keychains/ios-build.keychain -P $P12_SECRET -A /usr/bin/codesign
# Some MAGIC (TODO INVESTIGATE) which helps to NOT hangs the codesign
security set-key-partition-list -S apple-tool:,apple: -s -k ci ios-build.keychain

# Put the provisioning profile in place
mkdir -p ~/Library/MobileDevice/Provisioning\ Profiles
cp "./profile/UnitTestRepoAppAdHocCI.mobileprovision" ~/Library/MobileDevice/Provisioning\ Profiles/
