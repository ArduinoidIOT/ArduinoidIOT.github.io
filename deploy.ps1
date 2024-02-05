yarn build
cd dist
echo "" > .nojekyll
# echo "brin.is-a.dev" > CNAME

git init
git checkout -B main
git add -A
git commit -m "deploy"

git push -f https://github.com/ArduinoidIOT/arduinoidiot.github.io main:gh-pages
cd ..