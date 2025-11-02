# 🚀 Transformar macOS en Arch Linux + Hyprland (2025)

## 📋 Índice
1. [Filosofía y Enfoque](#filosofía-y-enfoque)
2. [Gestor de Ventanas (Hyprland Alternative)](#gestor-de-ventanas)
3. [Gestor de Paquetes](#gestor-de-paquetes)
4. [Terminal y Shell](#terminal-y-shell)
5. [Configuración del Sistema](#configuración-del-sistema)
6. [Herramientas CLI Esenciales](#herramientas-cli-esenciales)
7. [Dotfiles y Automatización](#dotfiles-y-automatización)

---

## 🎯 Filosofía y Enfoque

**Arch Linux** se caracteriza por:
- Minimalismo y control total
- Rolling release (siempre actualizado)
- CLI-first workflow
- Configuración mediante archivos de texto
- AUR (Arch User Repository)

**Hyprland** es un compositor Wayland con:
- Animaciones fluidas
- Configuración declarativa
- Tiling window management
- Altamente personalizable

### En macOS conseguiremos:
- **yabai** (tiling window manager similar a Hyprland)
- **skhd** (hotkey daemon para atajos de teclado)
- **Homebrew + Nix** (gestión de paquetes tipo pacman + AUR)
- **kitty/alacritty** (terminal GPU-accelerated)
- **Neovim/Helix** (editor modal)

---

## 🪟 Gestor de Ventanas (Hyprland Alternative)

### 1. Instalar yabai (Window Manager)

```bash
# Instalar yabai
brew install koekeishiya/formulae/yabai

# Iniciar servicio
yabai --start-service

# Configurar permisos (requerido en macOS moderno)
sudo yabai --load-sa
```

### 2. Instalar skhd (Hotkey Daemon)

```bash
# Instalar skhd
brew install koekeishiya/formulae/skhd

# Iniciar servicio
skhd --start-service
```

### 3. Configuración yabai (~/.yabairc)

```bash
# Crear archivo de configuración
cat > ~/.yabairc << 'EOF'
#!/usr/bin/env sh

# Configuración global
yabai -m config layout bsp
yabai -m config top_padding    12
yabai -m config bottom_padding 12
yabai -m config left_padding   12
yabai -m config right_padding  12
yabai -m config window_gap     12

# Configuración de mouse
yabai -m config mouse_follows_focus on
yabai -m config focus_follows_mouse autoraise

# Configuración de ventanas
yabai -m config window_opacity on
yabai -m config active_window_opacity 1.0
yabai -m config normal_window_opacity 0.95
yabai -m config window_shadow float

# Animaciones (similar a Hyprland)
yabai -m config window_animation_duration 0.25

# Excepciones (apps que no queremos en tiling)
yabai -m rule --add app="^System Settings$" manage=off
yabai -m rule --add app="^Calculator$" manage=off
yabai -m rule --add app="^Finder$" manage=off

echo "yabai configuration loaded..."
EOF

chmod +x ~/.yabairc
```

### 4. Configuración skhd (~/.skhdrc)

```bash
# Crear archivo de atajos (similar a Hyprland keybinds)
cat > ~/.skhdrc << 'EOF'
# Focus window
alt - h : yabai -m window --focus west
alt - j : yabai -m window --focus south
alt - k : yabai -m window --focus north
alt - l : yabai -m window --focus east

# Move window
shift + alt - h : yabai -m window --swap west
shift + alt - j : yabai -m window --swap south
shift + alt - k : yabai -m window --swap north
shift + alt - l : yabai -m window --swap east

# Resize window
ctrl + alt - h : yabai -m window --resize left:-50:0 || yabai -m window --resize right:-50:0
ctrl + alt - j : yabai -m window --resize bottom:0:50 || yabai -m window --resize top:0:50
ctrl + alt - k : yabai -m window --resize top:0:-50 || yabai -m window --resize bottom:0:-50
ctrl + alt - l : yabai -m window --resize right:50:0 || yabai -m window --resize left:50:0

# Switch workspace
alt - 1 : yabai -m space --focus 1
alt - 2 : yabai -m space --focus 2
alt - 3 : yabai -m space --focus 3
alt - 4 : yabai -m space --focus 4
alt - 5 : yabai -m space --focus 5

# Move window to workspace
shift + alt - 1 : yabai -m window --space 1
shift + alt - 2 : yabai -m window --space 2
shift + alt - 3 : yabai -m window --space 3
shift + alt - 4 : yabai -m window --space 4
shift + alt - 5 : yabai -m window --space 5

# Toggle window
alt - f : yabai -m window --toggle zoom-fullscreen
alt - t : yabai -m window --toggle float

# Balance windows
shift + alt - 0 : yabai -m space --balance

# Rotate tree
alt - r : yabai -m space --rotate 90

# Launch apps
cmd - return : open -na /Applications/kitty.app
EOF
```

### 5. Deshabilitar SIP (System Integrity Protection)

```bash
# IMPORTANTE: Esto es necesario para yabai funcione completamente
# 1. Reinicia en Recovery Mode (Cmd+R al arrancar)
# 2. En Terminal ejecuta: csrutil disable
# 3. Reinicia normalmente
```

---

## 📦 Gestor de Paquetes

### Homebrew (pacman alternative)

```bash
# Ya lo tienes instalado, actualiza
brew update && brew upgrade

# Instalar paquetes esenciales
brew install \
  neovim \
  ripgrep \
  fd \
  fzf \
  bat \
  eza \
  zoxide \
  starship \
  git-delta \
  lazygit \
  btop \
  jq \
  yq \
  tldr \
  gh
```

### Nix (AUR alternative)

```bash
# Instalar Nix para paquetes más avanzados
sh <(curl -L https://nixos.org/nix/install)

# Habilitar nix-command y flakes
mkdir -p ~/.config/nix
cat > ~/.config/nix/nix.conf << EOF
experimental-features = nix-command flakes
EOF
```

---

## 💻 Terminal y Shell

### 1. Instalar Kitty (Terminal GPU-accelerated)

```bash
brew install --cask kitty

# Configuración ~/.config/kitty/kitty.conf
mkdir -p ~/.config/kitty
cat > ~/.config/kitty/kitty.conf << 'EOF'
# Fuente
font_family      JetBrainsMono Nerd Font
font_size        13.0

# Tema (Catppuccin Mocha - popular en Hyprland)
include themes/catppuccin-mocha.conf

# Transparencia (como Hyprland)
background_opacity 0.95

# Rendimiento
repaint_delay 10
input_delay 3
sync_to_monitor yes

# Tabs
tab_bar_style powerline
tab_powerline_style slanted

# Keymaps
map cmd+t new_tab
map cmd+w close_tab
map cmd+1 goto_tab 1
map cmd+2 goto_tab 2
map cmd+3 goto_tab 3

# Shell integration
shell_integration enabled
EOF

# Descargar tema Catppuccin
mkdir -p ~/.config/kitty/themes
curl -o ~/.config/kitty/themes/catppuccin-mocha.conf \
  https://raw.githubusercontent.com/catppuccin/kitty/main/themes/mocha.conf
```

### 2. Configurar Starship (Prompt moderno)

```bash
# Ya instalado con brew
# Configuración ~/.config/starship.toml
mkdir -p ~/.config
cat > ~/.config/starship.toml << 'EOF'
format = """
[┌───────────────────>](bold green)
[│](bold green)$directory$git_branch$git_status
[└─>](bold green) """

[directory]
style = "blue bold"
truncation_length = 3
truncate_to_repo = true

[git_branch]
symbol = " "
style = "purple bold"

[git_status]
style = "red bold"
ahead = "⇡${count}"
diverged = "⇕⇡${ahead_count}⇣${behind_count}"
behind = "⇣${count}"
EOF
```

### 3. Configurar Zsh (Shell mejorado)

```bash
# Instalar Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Instalar plugins útiles
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Configurar ~/.zshrc
cat >> ~/.zshrc << 'EOF'

# Plugins
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  fzf
  z
)

# Aliases tipo Arch
alias ls='eza --icons'
alias ll='eza -l --icons'
alias la='eza -la --icons'
alias cat='bat'
alias find='fd'
alias grep='rg'
alias top='btop'

# Homebrew (pacman-like)
alias pacman='brew'
alias pacman-S='brew install'
alias pacman-R='brew uninstall'
alias pacman-Syu='brew update && brew upgrade'
alias pacman-Ss='brew search'
alias pacman-Qi='brew info'

# Git aliases
alias g='git'
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git pull'
alias gd='git diff'
alias lg='lazygit'

# Zoxide (cd mejorado)
eval "$(zoxide init zsh)"
alias cd='z'

# Starship
eval "$(starship init zsh)"

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

EOF

source ~/.zshrc
```

---

## ⚙️ Configuración del Sistema

### 1. Reducir animaciones del sistema

```bash
# Deshabilitar animaciones lentas
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0.5

# Reiniciar Dock
killall Dock
```

### 2. Configurar gestos y trackpad

```bash
# Velocidad de trackpad al máximo
defaults write NSGlobalDomain com.apple.trackpad.scaling -float 3.0

# Tap to click
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
```

### 3. Ocultar barra de menú (estilo minimalista)

```bash
defaults write NSGlobalDomain _HIHideMenuBar -bool true
killall Finder
```

---

## 🛠️ Herramientas CLI Esenciales

```bash
# Development
brew install \
  node \
  python3 \
  go \
  rust \
  docker \
  kubectl \
  terraform

# Networking
brew install \
  wget \
  curl \
  httpie \
  nmap

# System monitoring
brew install \
  htop \
  btop \
  dust \
  duf \
  procs

# Productivity
brew install \
  tmux \
  screen \
  ranger \
  mc

# File management
brew install \
  rsync \
  rclone \
  tree
```

---

## 📁 Dotfiles y Automatización

### Script de instalación completo

```bash
# Crear script de setup
cat > ~/setup-arch-macos.sh << 'EOF'
#!/bin/bash

echo "🚀 Configurando macOS estilo Arch Linux + Hyprland..."

# Instalar yabai y skhd
brew install koekeishiya/formulae/yabai koekeishiya/formulae/skhd

# Instalar herramientas esenciales
brew install neovim ripgrep fd fzf bat eza zoxide starship git-delta lazygit btop jq

# Instalar terminal
brew install --cask kitty

# Iniciar servicios
yabai --start-service
skhd --start-service

# Configurar zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "✅ Instalación completada!"
echo "⚠️  IMPORTANTE: Debes deshabilitar SIP para yabai funcione completamente"
echo "    1. Reinicia en Recovery Mode (Cmd+R)"
echo "    2. Ejecuta: csrutil disable"
echo "    3. Ejecuta: sudo yabai --load-sa"
EOF

chmod +x ~/setup-arch-macos.sh
```

---

## 🎨 Personalización Avanzada

### 1. Barra superior (Polybar alternative)

```bash
# Instalar SketchyBar
brew tap FelixKratz/formulae
brew install sketchybar

# Iniciar servicio
brew services start sketchybar
```

### 2. Notificaciones (Dunst alternative)

```bash
# Usar terminal-notifier
brew install terminal-notifier

# Ejemplo de uso
terminal-notifier -title "Test" -message "Hola desde CLI"
```

### 3. Wallpaper dinámico

```bash
# Script para cambiar wallpaper
cat > ~/bin/setwallpaper << 'EOF'
#!/bin/bash
osascript -e "tell application \"System Events\" to tell every desktop to set picture to \"$1\""
EOF

chmod +x ~/bin/setwallpaper
```

---

## 🔄 Comandos de Mantenimiento

```bash
# Actualizar todo el sistema (como pacman -Syu)
brew update && brew upgrade && brew cleanup

# Limpiar caché
brew cleanup -s
rm -rf "$(brew --cache)"

# Verificar integridad
brew doctor

# Listar paquetes instalados
brew list

# Buscar paquetes
brew search <nombre>

# Ver información de paquete
brew info <nombre>

# Desinstalar y limpiar dependencias
brew uninstall --zap <nombre>
brew autoremove
```

---

## 📚 Recursos Adicionales

- **yabai Wiki**: https://github.com/koekeishiya/yabai/wiki
- **skhd**: https://github.com/koekeishiya/skhd
- **Dotfiles ejemplos**: https://github.com/mathiasbynens/dotfiles
- **r/unixporn**: Inspiración para configuraciones

---

## ✅ Checklist de Instalación

- [ ] Instalar yabai y skhd
- [ ] Configurar ~/.yabairc y ~/.skhdrc
- [ ] Deshabilitar SIP
- [ ] Instalar Kitty terminal
- [ ] Configurar Starship prompt
- [ ] Instalar herramientas CLI esenciales
- [ ] Configurar aliases en ~/.zshrc
- [ ] Personalizar tema y colores
- [ ] Configurar dotfiles en repositorio git
- [ ] Instalar SketchyBar (opcional)

---

**¡Tu macOS ahora es prácticamente Arch Linux + Hyprland! 🎉**
