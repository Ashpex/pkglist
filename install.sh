#!/bin/sh
pacman -Qqe > pkglist.txt
sudo pacman -S $(comm -12 <(pacman -Slq | sort) <(sort pkglist.txt))
sudo pacman -S - < pkglist.txt
sudo pacman -Rsu $(comm -23 <(pacman -Qq | sort) <(sort pkglist.txt))
