mkdir src/app src/styles src/tests
mv src/App.test.js src/tests
mv src/App.* src/app/
mv src/logo.svg src/app
mv src/index.css src/styles
cat src/styles/index.css >> src/styles/index.scss
cat src/app/App.css >> src/app/App.scss
find ./src -type f -name '*.css' -delete
cp ~/workspace/scripts/reactsetup/.eslintrc .
sed -i 's:App.css:App.scss:' src/app/App.js
sed -i 's:index.css:styles/index.scss:' src/index.js
sed -i 's:./App:./app/App:' src/index.js
rm -rf yarn.lock node_modules
npm i
npm i node-sass -S
code .