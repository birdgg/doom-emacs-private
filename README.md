# doom-emacs-private
My config for [Doom Emacs](https://github.com/hlissner/doom-emacs)

## Get start

``` bash
glt clone https://github.com/birdgg/doom-emacs-private.git ~/.doom.d
```

## replace emacs icon

``` bash
cd ~/.doom.d;bin/icon 
```

## Notice
You do if you modify packages.el
You must use bin/doom refresh if you:

a) Modify your doom! block in ~/.doom.d/init.el
b) Modify your ~/.doom.d/packages.el file
c) Add/remove ;;;###autoload'ed functions in your autoloads files (e.g. ~/.doom.d/autoload.el or ~/.doom.d/autoload/*.el)
d) Update doom via git pull instead of bin/doom upgrade
e) Fiddle around in ~/.emacs.d/.local

