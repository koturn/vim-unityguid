vim-unityguid
=============

Fuzzy finder by GUID of Unity.

## Usage

```vim
:CtrlPUnityGuid
```

```vim
:CtrlPUnityGuidFile
```

```vim
:CtrlPUnityGuidDir
```


## Installation

### With [dein.vim](https://github.com/Shougo/dein.vim "Shougo/dein.vim")

#### TOML Style

Write following code to TOML configuration file and load it with `dein#load_toml()`.

```toml
[[plugins]]
repo = 'koturn/vim-unityguid'
depends = 'ctrlp.vim'
on_cmd = ['CtrlPUnityGuid', 'CtrlPUnityGuidFile', 'CtrlPUnityGuidDir'],
on_func = 'unityguid'
```

#### vimrc Style

Write following code to your `.vimrc` and execute `:call dein#install()` in
your Vim.

```vim
call dein#add('koturn/vim-unityguid', {
      \ 'depends': 'ctrlp.vim,
      \ 'on_cmd': [
      \   'CtrlPUnityGuid',
      \   'CtrlPUnityGuidFile',
      \   'CtrlPUnityGuidDir',
      \ ],
      \ 'on_func': 'unityguid'
      \})
```

### With [NeoBundle](https://github.com/Shougo/neobundle.vim "Shougo/neobundle.vim")

Write following code to your `.vimrc` and execute `:NeoBundleInstall` in your
Vim.

```vim
NeoBundle 'koturn/vim-unityguid'
```

If you want to use `:NeoBundleLazy`, write following code in your .vimrc.

```vim
NeoBundle 'koturn/vim-unityguid', {
      \ 'depends': 'ctrlp.vim,
      \ 'on_cmd': [
      \   'CtrlPUnityGuid',
      \   'CtrlPUnityGuidFile',
      \   'CtrlPUnityGuidDir',
      \ ],
      \ 'on_func': 'unityguid'
      \}
```

### With [Vundle](https://github.com/VundleVim/Vundle.vim "VundleVim/Vundle.vim")

Write following code to your `.vimrc` and execute `:PluginInstall` in your Vim.

```vim
Plugin 'koturn/vim-unityguid'
```

### With [vim-plug](https://github.com/junegunn/vim-plug "junegunn/vim-plug")

Write following code to your `.vimrc` and execute `:PlugInstall` in your Vim.

```vim
Plug 'koturn/vim-unityguid'
```

### With [vim-pathogen](https://github.com/tpope/vim-pathogen "tpope/vim-pathogen")

Clone this repository to the package directory of pathogen.

```
$ git clone https://github.com/koturn/vim-unityguid.git ~/.vim/bundle/vim-unityguid
```

### With packages feature

In the first, clone this repository to the package directory.

```
$ git clone https://github.com/koturn/vim-unityguid.git ~/.vim/pack/koturn/opt/vim-unityguid
```

Second, add following code to your `.vimrc`.

```vim
packadd vim-unityguid
```

### With manual

If you don't want to use plugin manager, put files and directories on
`~/.vim/`, or `%HOME%/vimfiles/` on Windows.


## Dependent plugins

### Required

- [ctrlpvim/ctrlp.vim](https://github.com/ctrlpvim/ctrlp.vim "ctrlpvim/ctrlp.vim")


## LICENSE

This software is released under the MIT License, see [LICENSE](LICENSE "LICENSE").
