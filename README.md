# dots
This is a very simple solution to copy all my configuration files and
install all my applications that i need on a fresh Arch Linux installation.

## What do i mean?
Let's say i installed a new Arch on my main machine, and i wanted a fresh
install so i also deleted my home directory as well. Now all i have to do is
to clone this repository, then execute two scripts, then all my applications
and their configuration files will be ready for me.

## How does it work?
First, i will go to the packages directory which holds two files, one which
contains all the package names and the other that will install those packages
via pacman and trizen (AUR helper). Of course in case of trizen, it installs
trizen itself, too. Then i will go to the root folder (of this repo) and i
execute the `configure` file with a `set` argument, that leads to all my
configuration files being copied into their paths. This requires the path
to those files, so the `filename` file is there just to provide those. Besides
copying them, the `configure` script will `chmod 755` those files that need
to be executables. And the way i implemented it is to have the `filename` file
having four columns:

<dot_loc> | <config_loc> | <sudo_flag> | <exec_flag>

The first columns specifies where the file should be in the `dots` repo
directory. Second is the actual path of that file. Third is the flag to which
if the file should be copied where it needs root permissions (so that we can
use `sudo` to copy it). Last is the flag to which if the file should be
`chmod`ed.

## brightness and visudo
Just one small hand made mod. Must add this to the sudoers file for the
brightness script to work:
```
m47h4r ALL=(root) NOPASSWD: /home/m47h4r/bin/brightness
```
