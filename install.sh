#!/usr/bin/env zsh

[[  -f $HOME/.zshrc  ]] &
  print "Moving ~/.zshrc to ~.zshrc.old" ; mv ~/.zshrc ~/.zshrc.old

print "Linking zshrc to ~/.zshrc"
ln -s `pwd`/zsh/zshrc ~/.zshrc

[[  -f $HOME/.emacs  ]] &
  print "Moving ~/.emacs to ~.emacs.old"; mv ~/.emacs ~/.emacs.old

print "Linking emacs to ~/.emacs"
ln -s `pwd`/emacs/emacs ~/.emacs




