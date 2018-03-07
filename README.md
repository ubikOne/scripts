# Scripts

## A collection of simple and useful tools for everyday use

## License:

  all of scripts are free softare. You can redistribute it and/or modify it under the
  terms of the GNU General Public License Version 3.0. as published by
  the Free Software Foundation. A copy of the GNU GPL 3.0 is provided with the
  software.

  for more read LICENSE file or visit [GNU GPL-3.0][license-url] website.

## [install][install-url] 

1. Description:

  install is simple script to install scripts on your system.

2. Use case:

  just launch the script and wiat for finnish

  ```bash
  ./install
  ```

## [start][start-url] version 0.3
### Fresh system must (for me) install

1. Description:

  start is install script for fresh Debian/Ubuntu install.

2. Use case:

  first you need to give appropriate permissions to script

  ```bash
  sudo chmod +x start
  ```
  then just run the script and answer few questionns
  ```bash
  ./start
  ```  
  and answer few questionns

## [up][up-url] version 1.0.2
### System update & upgrade tool, for debian and debian based linux/gnu distributions

1. Description:

  up is simple tool to automates the update procedure for Debian/Ubuntu.

2. Instalation:

  Unpack the "up" script from the archive and move it to 
  ```bash
  /usr/local/bin
  ```
  or
  ```bash
  ~/bin
  ```
  
3. Use case:

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

## Coded by Bartłomiej Błażejewski (GNU/General Public License version 3.0)

## Disclaimer:

THIS SOFTWARE IS PROVIDED “AS IS” AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


[ezee-url]: https://github.com/EzeeLinux
[ezee-page-url]: http://www.ezeelinux.com/bash-scripts/
[up-video-url]: https://youtu.be/47hbXbqbwso
[ask-url]: https://gist.github.com/davejamesmiller/1965569
[license-url]: https://www.gnu.org/licenses/gpl-3.0.en.html

[up-url]: https://github.com/ubikOne/scripts/blob/master/scripts/up
[start-url]:https://github.com/ubikOne/scripts/blob/master/scripts/start
[install-url]:https://github.com/ubikOne/scripts/blob/master/scripts/install
