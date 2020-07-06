Para instalar o Phonopy no LoboC, podemos fazer:

`$ git clone https://github.com/phonopy/phonopy.git`

`$ cd phonopy`

`$ python3.6m setup.py install --user`


#####

Building using setup.py
If package installation is not possible or you want to compile with special compiler or special options, phonopy is built using setup.py. In this case, manual modification of setup.py may be needed.

Download the source code at

https://pypi.python.org/pypi/phonopy

and extract it:

% tar xvfz phonopy-1.11.12.31.tar.gz
% cd phonopy-1.11.12.31
The other option is using git to clone the phonopy repository from github:

% git clone https://github.com/phonopy/phonopy.git
% cd phonopy
Set up C-libraries for python C-API and python codes. This can be done as follows:

Run setup.py script:

% python setup.py install --user
Watching carefully where the phonopy commands and library are installed. Those locations can be ~/.local/bin and ~/.local/lib directories, respectively.

Assuming the installation location is those shown in the step 2, set $PATH and $PYTHONPATH:

export PYTHONPATH=~/.local/lib:$PYTHONPATH
export PATH=~/.local/bin:$PATH
or if PYTHONPATH is not yet set in your system:

export PYTHONPATH=~/.local/lib
export PATH=~/.local/bin:$PATH
in your .bashrc (or maybe .bash_profile), .zshenv, or other script for the other shells.
