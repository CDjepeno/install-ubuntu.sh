#!/bin/bash

# Définir de nouveaux alias Git
git config --global alias.c checkout
git config --global alias.b branch
git config --global alias.cm commit -m
git config --global alias.s status
git config --global alias.h 'log --oneline --graph --decorate --all'
git config --global alias.df 'diff --color-words'
git config --global alias.m merge
git config --global alias.r rebase
git config --global alias.p pull
git config --global alias.f fetch
git config --global alias.l log

# Afficher la liste des alias Git après les modifications
echo "Les alias Git ont été mis à jour :"
git config --global --list | grep alias