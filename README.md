# dotfiles

- arch linux
- hyprland
- ghostty / alacritty
- cursor / vscode
- neovim / zed
- fish
- tmux / zellij

cursor-dark theme (nvim)

---

webapps need to run through zen not chrome

hyprland setup -> fonts, transparency, workspaces and stuff

## development apps

terminal setup -> ghostty / alacritty / fish
node, bun..
zed / nvim
cursor / vscode


.
├── alacritty
│   └── alacritty.toml
├── claude
│   ├── CLAUDE.md
│   ├── settings.json
│   └── settings.local.json
├── code
│   └── settings.json
├── color-schemes
│   ├── TokyoDay.colors
│   └── TokyoNight.colors
├── fish
│   ├── conf.d
│   │   ├── bedrock.fish
│   │   ├── hydro.fish
│   │   ├── plugin-bang-bang.fish
│   │   └── z.fish
│   ├── config.fish
│   ├── fish_plugins
│   ├── fish_variables
│   └── functions
│       ├── dev.fish
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
├── git
│   └── .gitconfig
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
├── README.md
├── tmux.conf
├── workflows
│   ├── ci.yml
│   ├── deploy.yml
│   └── release.yml
├── zed
│   └── settings.json
└── zellij
    └── config.kdl

