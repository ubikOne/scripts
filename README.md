# Scripts

## A collection of simple and useful tools for everyday use

### [start][start-url] - Fresh system must (for me) install

1. Description:

  start is install script for fresh Debian/Ubuntu install.

2. License:

  up is free softare. You can redistribute it and/or modify it under the
  terms of the GNU General Public License Version 3.0. as published by
  the Free Software Foundation. A copy of the GNU GPL 3.0 is provided with the
  software.

  for more read LICENSE file or visit [GNU GPL-3.0][license-url] website.

3. Use case:

  first you need to give appropriate permissions to script

  ```bash
  sudo chmod +x start
  ```
  then just run the script and answer few questionns
  ```bash
  ./start
  ```  
  and answer few questionns

### [up][up-url] - System update & upgrade tool, for debian and debian based linux/gnu distributions

1. Description:

  up is simple tool to automates the update procedure Debian and Ubuntu based Linux/GNU systems.

2. Instalation:

  Unpack the "up" script from the archive and move it to 
  ```bash
  /usr/local/bin
  ```
  or
  ```bash
  ~/bin
  ```
  
3. License:

  up is free softare. You can redistribute it and/or modify it under the
  terms of the GNU General Public License Version 3.0. as published by
  the Free Software Foundation. A copy of the GNU GPL 3.0 is provided with the
  software.

  for more read LICENSE file or visit [GNU GPL-3.0][license-url] website.

4. Use case:

  ```bash
  up -u
  ```
  or
  ```bash
  up -upgrade
  ```  
  update the apt cache and then perform programs and packages update

  ```bash
  up -U 
  ```
  or
  ```bash
  up --full-upgrade
  ```  
  update the apt cache and then perform a full distribution update


  ```bash
  up -r
  ```
  or
  ```bash
  up --remove 
  ```  
  autoremoving orphan packages and dependencies

### In scripts used [ASK][ask-url]

### The inspiration for the creation of this repository was [An Introduction to Up][up-video-url]
### You can find script on [EzeeLinux][ezee-url] GitHub.
### For more please visit [EzeeLinux][ezee-page-url] website.


[ezee-url]: https://github.com/EzeeLinux
[ezee-page-url]: http://www.ezeelinux.com/bash-scripts/
[up-video-url]: https://youtu.be/47hbXbqbwso
[ask-url]: https://gist.github.com/davejamesmiller/1965569
[license-url]: https://www.gnu.org/licenses/gpl-3.0.en.html

[up-url]: https://github.com/ubikOne/scripts/blob/master/scripts/up
[start-url]:https://github.com/ubikOne/scripts/blob/master/scripts/start
