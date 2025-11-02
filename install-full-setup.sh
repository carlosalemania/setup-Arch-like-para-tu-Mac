#!/bin/bash

# ============================================================================
# SCRIPT DE INSTALACIÓN COMPLETO
# Transforma macOS en entorno tipo Arch Linux + Hyprland
# + Herramientas de productividad en ventas
# ============================================================================

set -e  # Exit on error

# Colores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Funciones de utilidad
print_header() {
    echo -e "\n${BLUE}================================================${NC}"
    echo -e "${BLUE}$1${NC}"
    echo -e "${BLUE}================================================${NC}\n"
}

print_success() {
    echo -e "${GREEN}✅ $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}⚠️  $1${NC}"
}

print_error() {
    echo -e "${RED}❌ $1${NC}"
}

# Verificar que estamos en macOS
if [[ "$OSTYPE" != "darwin"* ]]; then
    print_error "Este script solo funciona en macOS"
    exit 1
fi

print_header "🚀 INSTALACIÓN COMPLETA - ARCH MACOS + SALES TOOLS"
echo "Este script instalará:"
echo "  - yabai + skhd (Window Manager)"
echo "  - Terminal moderna (kitty)"
echo "  - Shell setup (zsh + plugins)"
echo "  - CLI tools esenciales"
echo "  - Herramientas de ventas"
echo ""
read -p "¿Continuar? (y/n) " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    exit 1
fi

# ============================================================================
# 1. VERIFICAR HOMEBREW
# ============================================================================

print_header "1. Verificando Homebrew"

if command -v brew &> /dev/null; then
    print_success "Homebrew ya instalado"
    brew update
else
    print_warning "Instalando Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# ============================================================================
# 2. WINDOW MANAGER (yabai + skhd)
# ============================================================================

print_header "2. Instalando Window Manager (yabai + skhd)"

brew install koekeishiya/formulae/yabai
brew install koekeishiya/formulae/skhd

print_success "yabai y skhd instalados"

# Configurar yabai
print_warning "Configurando yabai..."
cat > ~/.yabairc << 'EOF'
#!/usr/bin/env sh

# Global settings
yabai -m config layout bsp
yabai -m config top_padding    12
yabai -m config bottom_padding 12
yabai -m config left_padding   12
yabai -m config right_padding  12
yabai -m config window_gap     12

# Mouse settings
yabai -m config mouse_follows_focus on
yabai -m config focus_follows_mouse autoraise

# Window settings
yabai -m config window_opacity on
yabai -m config active_window_opacity 1.0
yabai -m config normal_window_opacity 0.95
yabai -m config window_shadow float
yabai -m config window_animation_duration 0.25

# Rules
yabai -m rule --add app="^System Settings$" manage=off
yabai -m rule --add app="^Calculator$" manage=off
yabai -m rule --add app="^Finder$" manage=off

echo "yabai configuration loaded..."
EOF

chmod +x ~/.yabairc

# Configurar skhd
print_warning "Configurando skhd..."
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

print_success "Configuraciones creadas"

# ============================================================================
# 3. CLI TOOLS ESENCIALES
# ============================================================================

print_header "3. Instalando CLI Tools"

# Core tools
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
    gh \
    tree \
    wget \
    curl \
    httpie

print_success "CLI tools instalados"

# ============================================================================
# 4. TERMINAL (Kitty)
# ============================================================================

print_header "4. Instalando Kitty Terminal"

brew install --cask kitty

# Configurar kitty
mkdir -p ~/.config/kitty
cat > ~/.config/kitty/kitty.conf << 'EOF'
# Font
font_family      JetBrainsMono Nerd Font
font_size        13.0

# Theme
include themes/catppuccin-mocha.conf

# Transparency
background_opacity 0.95

# Performance
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

# Descargar tema
mkdir -p ~/.config/kitty/themes
curl -sS -o ~/.config/kitty/themes/catppuccin-mocha.conf \
    https://raw.githubusercontent.com/catppuccin/kitty/main/themes/mocha.conf

# Instalar Nerd Font
brew tap homebrew/cask-fonts
brew install --cask font-jetbrains-mono-nerd-font

print_success "Kitty configurado"

# ============================================================================
# 5. SHELL SETUP (ZSH)
# ============================================================================

print_header "5. Configurando Zsh"

# Instalar Oh My Zsh si no existe
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    print_warning "Instalando Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# Plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions 2>/dev/null || true
git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting 2>/dev/null || true

# Configurar Starship
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

# Actualizar .zshrc
cat >> ~/.zshrc << 'EOF'

# ============================================================================
# ARCH MACOS CUSTOM CONFIG
# ============================================================================

# Plugins
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  fzf
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

# PATH
export PATH="$HOME/bin:$PATH"

EOF

print_success "Zsh configurado"

# ============================================================================
# 6. HERRAMIENTAS DE VENTAS
# ============================================================================

print_header "6. Instalando Herramientas de Ventas"

# Data tools
brew install \
    csvkit \
    miller \
    sqlite \
    duckdb \
    gum

# Task management
brew install \
    task \
    calcurse

# Notifications
brew install terminal-notifier

# Email
brew install neomutt

# Python tools
pip3 install pandas openpyxl termgraph 2>/dev/null || true

print_success "Herramientas de ventas instaladas"

# ============================================================================
# 7. SCRIPTS PERSONALIZADOS
# ============================================================================

print_header "7. Creando Scripts Personalizados"

mkdir -p ~/bin

# Script de lead scoring
cat > ~/bin/lead-score << 'EOFSCRIPT'
#!/bin/bash
EMAIL=$1
COMPANY=$2
INDUSTRY=$3
EMPLOYEES=$4
SCORE=0

case $INDUSTRY in
  "Technology"|"SaaS") SCORE=$((SCORE + 30)) ;;
  "Finance"|"Healthcare") SCORE=$((SCORE + 25)) ;;
  *) SCORE=$((SCORE + 10)) ;;
esac

if [ $EMPLOYEES -gt 500 ]; then
  SCORE=$((SCORE + 40))
elif [ $EMPLOYEES -gt 100 ]; then
  SCORE=$((SCORE + 25))
else
  SCORE=$((SCORE + 10))
fi

if [[ $EMAIL == *"gmail.com"* ]] || [[ $EMAIL == *"hotmail.com"* ]]; then
  SCORE=$((SCORE + 5))
else
  SCORE=$((SCORE + 20))
fi

if [ $SCORE -gt 70 ]; then
  PRIORITY="🔥 HOT"
elif [ $SCORE -gt 50 ]; then
  PRIORITY="⭐ WARM"
else
  PRIORITY="❄️  COLD"
fi

echo "Lead Score: $SCORE - $PRIORITY"
echo "Email: $EMAIL | Company: $COMPANY | Industry: $INDUSTRY"
EOFSCRIPT

chmod +x ~/bin/lead-score

# Script de notas de reunión
cat > ~/bin/meeting-notes << 'EOFSCRIPT'
#!/bin/bash
CLIENT=$1
DATE=$(date +%Y-%m-%d)
FILE="$HOME/Documents/meetings/${CLIENT}_${DATE}.md"
mkdir -p "$HOME/Documents/meetings"

cat > "$FILE" << TEMPLATE
# Meeting Notes - $CLIENT
**Date:** $DATE
**Time:** $(date +%H:%M)

## Attendees
- 

## Topics Discussed
- 

## Action Items
- [ ] 

## Next Steps
- 

## Notes
TEMPLATE

${EDITOR:-nvim} "$FILE"
EOFSCRIPT

chmod +x ~/bin/meeting-notes

print_success "Scripts personalizados creados"

# ============================================================================
# 8. CONFIGURACIÓN DEL SISTEMA
# ============================================================================

print_header "8. Optimizando Configuración del Sistema"

# Reducir animaciones
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0.5

# Trackpad
defaults write NSGlobalDomain com.apple.trackpad.scaling -float 3.0
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true

# Reiniciar Dock
killall Dock 2>/dev/null || true

print_success "Sistema optimizado"

# ============================================================================
# 9. INICIAR SERVICIOS
# ============================================================================

print_header "9. Iniciando Servicios"

# Iniciar yabai y skhd
yabai --start-service 2>/dev/null || print_warning "No se pudo iniciar yabai automáticamente"
skhd --start-service 2>/dev/null || print_warning "No se pudo iniciar skhd automáticamente"

print_success "Servicios iniciados"

# ============================================================================
# FINALIZACIÓN
# ============================================================================

print_header "✅ INSTALACIÓN COMPLETADA"

echo ""
echo -e "${GREEN}¡Tu macOS ha sido transformado!${NC}"
echo ""
echo "Próximos pasos:"
echo ""
echo "1. ${YELLOW}IMPORTANTE:${NC} Para que yabai funcione completamente:"
echo "   - Reinicia en Recovery Mode (Cmd+R al arrancar)"
echo "   - Abre Terminal y ejecuta: ${BLUE}csrutil disable${NC}"
echo "   - Reinicia normalmente"
echo "   - Ejecuta: ${BLUE}sudo yabai --load-sa${NC}"
echo ""
echo "2. Reinicia tu terminal o ejecuta: ${BLUE}source ~/.zshrc${NC}"
echo ""
echo "3. Lee las guías completas:"
echo "   - arch-macos-setup-2025.md"
echo "   - sales-workflow-cli-guide.md"
echo ""
echo "4. Scripts disponibles en ~/bin:"
echo "   - lead-score"
echo "   - meeting-notes"
echo ""
echo "5. Atajos de teclado principales:"
echo "   - Alt + h/j/k/l : Navegar ventanas"
echo "   - Shift + Alt + h/j/k/l : Mover ventanas"
echo "   - Alt + f : Fullscreen"
echo "   - Alt + 1-5 : Cambiar workspace"
echo ""
echo -e "${BLUE}¡Disfruta tu nuevo entorno tipo Arch Linux! 🎉${NC}"
echo ""
