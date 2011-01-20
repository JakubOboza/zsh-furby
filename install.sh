#!/usr/bin/env zsh

[[  -f $HOME/.zshrc  ]] &
  print "Moving ~/.zshrc to ~.zshrc.old" ; mv ~/.zshrc ~/.zshrc.old

print "Linking zshrc to ~/.zshrc"
ln -s `pwd`/zsh/zshrc ~/.zshrc

[[  -f $HOME/.emacs  ]] &
  print "Moving ~/.emacs to ~.emacs.old"; mv ~/.emacs ~/.emacs.old

print "Linking emacs to ~/.emacs"
ln -s `pwd`/emacs/emacs ~/.emacs

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



