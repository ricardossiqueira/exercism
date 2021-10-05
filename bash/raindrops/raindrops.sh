#!/usr/bin/env bash

raindrops () {
  n=$1;
  str="";

  if [ `echo "$n%3" | bc` -eq 0 ]; then
    str=$str"Pling";
  fi;

  if [ `echo "$n%5" | bc` -eq 0 ]; then
    str=$str"Plang";
  fi;

  if [ `echo "$n%7" | bc` -eq 0 ]; then
    str=$str"Plong";
  fi;

  if [[ $str = "" ]]; then
    str=$n;
  fi;

  echo $str;
  exit;
};

raindrops "$@";