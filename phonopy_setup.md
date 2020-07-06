Para instalar o Phonopy no LoboC, podemos fazer:

```bash
$ git clone https://github.com/phonopy/phonopy.git
$ cd phonopy
$ python3.6m setup.py install --user
```

Ajuste as variaveis no .bashrc (ou .profile):
```bash
export PYTHONPATH=~/.local/lib:$PYTHONPATH
export PATH=~/.local/bin:$PATH
```
