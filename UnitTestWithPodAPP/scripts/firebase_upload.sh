#!/bin/sh

echo "Upload to Firebase"
commit_message=$(git log -1 --pretty=%B)
date=$(TZ=":Europe/Amsterdam" date +"%d-%m-%Y %H:%M:%S")
release_notes="Log: $commit_message\nBuild date: $date"
echo "relase_notes = $release_notes"

firebase appdistribution:distribute  ./build/Cleverbase.ipa  \
  --app "$FIREBASE_APP_ID"  \
  --release-notes "$release_notes" \
  --token "$FIREBASE_TOKEN"


