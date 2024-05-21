# dotfiles

## Notes to future self

### Easily-forgotten dependencies

Besides usual dependencies like `git`, `vim`, and `zsh`, you need the following
things.

- [SauceCodePro Nerd Font](https://www.nerdfonts.com/font-downloads)
- Compile `rxvt-unicode` with the `wide-glyphs` USE flag.

### Store in single file, not multiple files

Configuration files like `.vimrc` should be created as a single file rather
than split into multiple files. I tried dividing my `.vimrc` into several
sub-files, but it became cumbersome to locate and edit the specific sub-file
needed. Even with shortcuts to open `.vimrc`, the actual edits were required in
the sub-files, which was frustrating. Configuration files should be easy to
edit and immediately effective. Although consolidating everything into one file
can make it lengthy and challenging to edit, using features like folding
settings, it is still better to keep everything in a single file.

### Manage multiple configuration files in a single repository

Previously, I have tried to separate this repository into multiple submodules,
but it was troublesome to manage them. When I had to modify a configuration, I
had to make a commit in both the main and submodule repositories. It is better
to keep everything in a single repository and manage them as separate files.
This way, I can easily modify and commit changes without worrying about the
submodules.
