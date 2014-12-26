# Installation

This installation is for a Unix/Linux/OS X environment.

### Dependencies
- R
- ggplot2

### Script installation
- Download [install script](https://github.com/vtphan/plot-tutorial/raw/master/docs/install.sh)
- From command prompt, run "bash install.sh"

The R scripts will be installed in $HOME/bin, which will be added to your PATH.

### Manual installation and configuration
- At command prompt: make $HOME/bin
- Move R scripts into $HOME/bin
- At command prompt: chmod u+x $HOME/bin/qq.R; chmod u+x $HOME/bin/cq.R
- In $HOME/.bashrc: PATH=$PATH:$HOME/bin
- At command prompt: source $HOME/.bashrc
