# pkglist

Generate the list of explicitly installed packages using command:

```shell
$ pacman -Qqe > pkglist.txt
```

+ `Q` - Queries the package database. This option allows you to view installed packages and their files, other useful meta-information about individual packages (dependencies, conflicts, install date, build date, size).

+ `q` - Shows less information for certain query operations. This is useful when pacman’s output is processed in a script.

+ `e` - Lists explicitly installed packages that are not required by any other package.
  pkglist.txt - It is the output file where you store the list of installed files.

 Run the following command to install packages from the backup list:

```shell
$ sudo pacman -S - < pkglist.txt
```

Just in case, the backup list includes foreign packages, such as **AUR** packages, remove them first, and then install the rest of packages using command:

```shell
$ sudo pacman -S $(comm -12 <(pacman -Slq | sort) <(sort pkglist.txt))
```

The above command will you remove the foreign packages. Type 'y' and hit ENTER to remove them. Finally, type 'y' to install the rest of the  packages from the list.

To remove all the packages on your newly installed system that are not mentioned in the backup list, run:



```shell
$ sudo pacman -Rsu $(comm -23 <(pacman -Qq | sort) <(sort pkglist.txt))
```



[Read more at ArchWiki](https://wiki.archlinux.org/index.php/Pacman/Tips_and_tricks)

