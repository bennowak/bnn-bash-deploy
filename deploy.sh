#!/bin/bash
msg=$1
ghrepo=""
hrrepo=""

do_add(){
  git add --all
}
do_ghrepo(){
  printf "GitHub being processed\n"
  git commit -m \""$msg\""
  git push origin master
}

do_hrrepo(){
  printf "Heroku being processed\n"
  git commit -am \""$msg\""
  git push heroku master
}


while [[ ! "$msg" ]];do
  echo "Please provide a commit message"
  read msg
done
echo "Please select a repo to push to:"
sel=-1
while [[ $sel -lt 1 || $sel -gt 4 ]];do
  printf "1.) GitHub\n2.) Heroku\n3.) BOTH\n4.) Exit"
  read sel
done
case $sel in
1)
  do_add
  do_ghrepo
  ;;
2)
  do_add
  do_hrrepo
  ;;
3)
  do_add
  do_ghrepo
  do_hrrepo
  ;;
4)
  echo "Goodbye!"
  ;;
esac
