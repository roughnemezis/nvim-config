# Neovim configuration files

```bash
> cd ~/.config
> git clone https://github.com/roughnemezis/nvim-config nvim
```

You can also clone the repo somewhere else on your computer and create a symbolic link in ~/.config/nvim pointing to the repo

Launch neovim and type :PlugInstall in the command line. This should install all plugins.

If you want the plugins to be installed to a custom folder, change the plug#begin argument in plugins.vim.

## React / Javascript configuration

You might install Typescript in your node environment to get it working (e.g. in a project created with create-react-app type:
```bash
> npm install typescript
```
