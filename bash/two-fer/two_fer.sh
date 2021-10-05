#!/usr/bin/env bash

two_fer () {
  name=${1:-"you"};
  echo "One for $name, one for me.";
}

two_fer "$@";