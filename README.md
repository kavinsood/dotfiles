# dotfiles

- arch linux
- hyprland
- alacritty
- cursor / vscode
- neovim / zed
- fish

kanagawa theme

---

webapps need to run through zen not chrome

hyprland setup -> fonts, transparency, workspaces and stuff

## development apps

terminal setup -> alacritty / fish
node, bun..
zed / nvim
cursor / vscode


.
├── alacritty
│   └── alacritty.toml
├── code
│   └── settings.json
├── color-schemes
│   ├── TokyoDay.colors
│   └── TokyoNight.colors
├── fish
│   ├── conf.d
│   │   ├── hydro.fish
│   │   ├── plugin-bang-bang.fish
│   │   └── z.fish
│   ├── config.fish
│   ├── fish_plugins
│   ├── fish_variables
│   └── functions
│       ├── fish_mode_prompt.fish
│       ├── fish_prompt.fish
│       ├── __history_previous_command_arguments.fish
│       ├── __history_previous_command.fish
│       ├── __z_add.fish
│       ├── __z_clean.fish
│       ├── __z_complete.fish
│       └── __z.fish
├── ghostty
│   └── config
├── hypr
│   ├── hypridle.conf
│   ├── hyprland.conf
│   ├── hyprlock.conf -> /home/kavin/.config/omarchy/current/theme/hyprlock.conf
│   └── monitors.conf
├── nvim
│   ├── init.lua
│   ├── lazy-lock.json
│   └── lua
│       ├── custom
│       │   └── plugins
│       │       └── init.lua
│       └── kickstart
│           ├── health.lua
│           └── plugins
│               ├── autopairs.lua
│               ├── debug.lua
│               ├── gitsigns.lua
│               ├── indent_line.lua
│               ├── lint.lua
│               └── neo-tree.lua
├── omarchy
├── README.md
├── workflows
│   ├── ci.yml
│   ├── deploy.yml
│   └── release.yml
└── zed
    └── settings.json

18 directories, 38 files

