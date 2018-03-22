echo "releasing..."

git config --global user.email "swisspush@post.ch"
git config --global user.name "Travis-CI"
git config credential.helper "store --file=.git/credentials"
echo "https://${GH_TOKEN}:@github.com" > .git/credentials
cat .git/credentials
echo aaa
git config --global --list

mvn --settings settings.xml -B release:prepare -Pdo-release -DreleaseVersion=0.4.15 -DdevelopmentVersion=0.4.16-SNAPSHOT
mvn --settings settings.xml release:perform -Pdo-release
