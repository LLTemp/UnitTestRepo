
# compute base64 of UnitTestWithPod.framework.zip
openssl base64 -in ./UnitTestWithPod.framework.zip -out ./base64.txt -A
base64content=$(cat base64.txt)

#
sha1content=$(curl \
  -X GET \
-H "Accept: application/vnd.github.v3+json" \
-H "Authorization: token $GITHUB_TOKEN" \
  https://api.github.com/repos/LLTemp/test_sic_zip/contents/new_one.txt | jq .sha -r)

# get latest commit from master
latestCommit=$( curl \
  -X GET \
  -H "Authorization: token $GITHUB_TOKEN" \
  "https://api.github.com/repos/LLTemp/test_sic_zip/commits?&per_page=1" | jq '.[0].sha' -r)

# get file hash
sha1content=$(curl -X GET \
  -H "Authorization: token $GITHUB_TOKEN" \
  "https://api.github.com/repos/LLTemp/test_sic_zip/git/trees/${latestCommit}" | jq '.tree[] | select(.path == "UnitTestWithPod.framework.zip") | .sha' -r)

# compute body
echo "{\"message\":\"from curl\", \"content\":\"${base64content}\", \"sha\":\"${sha1content}\"}" > body.json

# upload
curl \
  -X PUT \
  -H "Accept: application/vnd.github.v3+json" \
  -H "Authorization: token $GITHUB_TOKEN" \
  https://api.github.com/repos/LLTemp/test_sic_zip/contents/UnitTestWithPod.framework.zip \
  -d @body.json