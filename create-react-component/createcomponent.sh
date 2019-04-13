#!/bin/sh

DIR="${0%/*}"

template () {
  eval "echo \"$(cat $1)\""
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

while getopts ":fc" opt; do
  case ${opt} in
    f )
    TYPE="function"
    ;;
    c )
    TYPE="class"
    ;;
    \? )
    echo "Usage: rc [ -c | -f ] components"
    exit 1
    ;;

  esac
done

for c in $@
do
  if [[ ! $c =~ -.* ]]; then
    component="${c^}"

    mkdir src/components/$component

    case $TYPE in
      function )
        template $DIR/react_template_f.txt > src/components/$component/$component.jsx
      ;;
      class )
        template $DIR/react_template.txt > src/components/$component/$component.jsx
      ;;
    esac
    template $DIR/react_css.txt > src/components/$component/$component.scss
    echo "Created $component component in src/components/$component"
  fi

done