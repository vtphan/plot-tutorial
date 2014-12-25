INSTALL_DIR="$HOME/bin"
if hash R 2>/dev/null; then
   if hash curl 2>/dev/null; then
      if [ ! -d $INSTALL_DIR ]; then
         echo "$INSTALL_DIR does not exist.  Create $INSTALL_DIR"
         mkdir $INSTALL_DIR
      fi
      echo "Download and install R scripts."
      cd $INSTALL_DIR
      curl -s https://raw.githubusercontent.com/vtphan/plot-tutorial/master/utilities/qq.R > $INSTALL_DIR/qq.R
      curl -s https://raw.githubusercontent.com/vtphan/plot-tutorial/master/utilities/cq.R > $INSTALL_DIR/cq.R
      curl -s https://raw.githubusercontent.com/vtphan/plot-tutorial/master/utilities/density.R > $INSTALL_DIR/density.R
      chmod u+x *.R

      if [[ ":$PATH:" == *":$INSTALL_DIR:"* ]]; then
         echo "$INSTALL_DIR is in PATH"
      else
         echo "Adding $INSTALL_DIR to PATH"
         echo "export PATH=$PATH:$INSTALL_DIR" >> $HOME/.bashrc
         source $HOME/.bashrc
      fi
      echo "qq.R, cq.R, density.R are now installed in $INSTALL_DIR, which is in your PATH.  Open a new terminal.  These scripts are now accessible in any directory."
   else
      echo "curl is not installed. You need to save the R scripts to $INSTALL_DIR and execute the command 'chmod +u *.R' in $INSTALL_DIR."
   fi
else
   echo "R is not installed."
fi