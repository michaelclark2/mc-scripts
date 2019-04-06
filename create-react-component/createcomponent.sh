#!/bin/sh

template () {
  eval "echo \"$(cat $1)\""
}

find_source () {
  SOURCE="${BASH_SOURCE[0]}"
  eval "echo $(dirname $SOURCE)"
}

if [ ! -d src ]; then
  echo "src directory not found."
  echo "Make sure you are in the root of the React project."
  echo "Exiting script."
  exit 1
fi

if [ ! -d src/components ]; then
  mkdir src/components
  echo "Created src/components directory."
fi

for c in $@
do
  component=$c

  mkdir src/components/$c
  touch src/components/$c/$c.{js,scss}
  template $(find_source)/react_template.txt > src/components/$c/$c.js
  template $(find_source)/react_css.txt > src/components/$c/$c.scss
  echo "Created $c component in src/components/$c"

done