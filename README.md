arcanist.vim
============

**This is out of order, because the arc inlines commands is gone. This renders this repository pretttty much useless :(**

Simple wrapper around arcanist for vim. Mostly useful for `:ArcInlines`.

`arc inlines` lists all of the inline comments for the current associated Differential revision.

`:ArcInlines` takes that list and shoves it into the quickfix buffer for quick navigation with `:cnext` and `:cprev`.

![vim-arcanist animated demo](http://i.imgur.com/Jyc9k.gif)

### [(Blurry) Screencast](https://vimeo.com/46753425)

Less Animated Explanation
-------------------------

If this is what you see in Phabricator:

![vim-arcanist-0](http://i.imgur.com/EIddn.png)

Then this is what you'll see when you run `arc inlines`.

![vim-arcanist-1](http://i.imgur.com/BL8IF.png)

And this is what you'll see when you run `:ArcInlines` inside of vim.

![vim-arcanist-2](http://i.imgur.com/XH0rL.png)

Which you can then navigate using all the normal quickfix navigation commands. `:help quickfix`, `:help :cn`, `:help :cp`.

Installation
------------

Compatible with [pathogen.vim](https://github.com/tpope/vim-pathogen) and 
[vundle](https://github.com/gmarik/vundle/).

For pathogen, install by running

    cd ~/.vim/bundle
    git clone git://github.com/phleet/vim-arcanist.git

For vundle, install by adding

    Bundle 'phleet/vim-arcanist'

to your `.vimrc` and running `:BundleInstall` inside of vim.

Once help tags have been generated, you can view the manual with
`:help arcanist`.

License
-------

Copyright (c) Jamie Wong.  Distributed under the same terms as Vim itself.
See `:help license`.
