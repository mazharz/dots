# dots

NOTE: I have `dotfiles` which replaces this repo.

This is a very simple solution to copy all my configuration files and
custom binaries.

## How does it work?
I will go to the root folder (of this repo) and i
execute the `configure` file with a `set` argument, that leads to all my
files being copied into their paths. This requires the path
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

