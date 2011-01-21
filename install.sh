#!/usr/bin/env zsh

config_files=(zsh emacs)

for i in $config_files; do
  [[  -f $HOME/.$i  ]] &
  print "Moving ~/.$i to ~.$i.old"; mv ~/.$i ~/.$i.old
  print "Linking $i to ~/.$i"
  ln -s `pwd`/$i/$i ~/.$i
done


if [[ $ZSH == "" ]]; then
  print "You don't have set \$ZSH to any dir"
  print "Backuping .profile to .profile.old"
  cp ~/.profile ~/.profile.old
  print "Adding export ZSH="`pwd`" to your .profile file"
  echo "export ZSH="`pwd` >> ~/.profile
  source ~/.profile
elif [[ $ZSH == `pwd` ]]; then
  print "Your \$ZSH points to right directory"
else
  print "Your \$ZSH is set to:"$ZSH
  print "Please check if it is pointing to "`pwd`
fi



