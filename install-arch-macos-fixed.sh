#!/bin/bash

# =============================================================================
# Script de Instalación: Arch-like macOS Setup 2025 (FIXED)
# =============================================================================
# Última actualización: Noviembre 2025
# Versión: 2.0 - Con correcciones para problemas de conectividad

set -e  # Salir si hay errores

# Colores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Funciones de utilidad
print_header() {
    echo ""
    echo -e "${BLUE}================================================${NC}"
    echo -e "${BLUE}$1${NC}"
    echo -e "${BLUE}================================================${NC}"
    echo ""
}

print_success() {
    echo -e "${GREEN}✅ $1${NC}"
}

print_error() {
    echo -e "${RED}❌ ERROR: $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}⚠️  $1${NC}"
}

print_info() {
    echo -e "${BLUE}ℹ️  $1${NC}"
}

# Función para verificar si un comando existe
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Función para reintentar comandos que fallan
retry_command() {
    local retries=3
    local count=0
    local delay=5

    until "$@"; do
        exit_code=$?
        count=$((count + 1))

        if [ $count -lt $retries ]; then
            print_warning "Comando falló. Reintentando en $delay segundos... (Intento $count de $retries)"
            sleep $delay
        else
            print_error "Comando falló después de $retries intentos"
            return $exit_code
        fi
    done

    return 0
}

# Función para verificar conectividad
check_connectivity() {
    print_info "Verificando conectividad a GitHub..."

    if ! curl -Is https://github.com --max-time 10 | head -1 | grep -q 200; then
        print_warning "Problemas de conectividad a GitHub detectados"
        print_info "Intentando soluciones..."

        # Limpiar DNS cache
        print_info "Limpiando DNS cache..."
        sudo dscacheutil -flushcache 2>/dev/null || true
        sudo killall -HUP mDNSResponder 2>/dev/null || true

        sleep 2

        # Verificar de nuevo
        if curl -Is https://github.com --max-time 10 | head -1 | grep -q 200; then
            print_success "Conectividad restaurada"
            return 0
        else
            print_error "No se puede conectar a GitHub"
            print_info "Por favor verifica tu conexión a internet y firewall"
            return 1
        fi
    fi

    print_success "Conectividad OK"
    return 0
}

# Función para configurar Git para mejor conectividad
configure_git() {
    print_info "Configurando Git para mejor conectividad..."

    # Incrementar timeouts
    git config --global http.postBuffer 524288000
    git config --global http.lowSpeedLimit 0
    git config --global http.lowSpeedTime 999999

    # Verificar si hay proxies configurados incorrectamente
    if git config --global --get http.proxy >/dev/null 2>&1; then
        print_warning "Proxy HTTP detectado en configuración de Git"
        read -p "¿Deseas eliminarlo? (y/n) " -n 1 -r
        echo
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            git config --global --unset http.proxy
            git config --global --unset https.proxy 2>/dev/null || true
            print_success "Proxies eliminados"
        fi
    fi

    print_success "Git configurado"
}

# =============================================================================
# INICIO DE LA INSTALACIÓN
# =============================================================================

clear
echo ""
echo -e "${BLUE}╔════════════════════════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║                                                            ║${NC}"
echo -e "${BLUE}║         🍎 ARCH-LIKE MACOS SETUP 2025 (FIXED) 🚀          ║${NC}"
echo -e "${BLUE}║                                                            ║${NC}"
echo -e "${BLUE}║            Convierte tu Mac en un entorno                 ║${NC}"
echo -e "${BLUE}║            similar a Arch Linux + Hyprland                ║${NC}"
echo -e "${BLUE}║                                                            ║${NC}"
echo -e "${BLUE}╚════════════════════════════════════════════════════════════╝${NC}"
echo ""

print_warning "Este script instalará y configurará:"
echo "  • Homebrew (si no está instalado)"
echo "  • Yabai (Tiling Window Manager)"
echo "  • Skhd (Hotkey Daemon)"
echo "  • SketchyBar (Status Bar)"
echo "  • Alacritty (Terminal)"
echo "  • Neovim, Tmux, Zsh y más herramientas CLI"
echo ""

read -p "¿Deseas continuar? (y/n) " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    print_info "Instalación cancelada"
    exit 0
fi

# =============================================================================
# VERIFICACIONES PRELIMINARES
# =============================================================================

print_header "0. Verificaciones Preliminares"

# Verificar sistema operativo
if [[ "$OSTYPE" != "darwin"* ]]; then
    print_error "Este script solo funciona en macOS"
    exit 1
fi
print_success "Sistema operativo: macOS $(sw_vers -productVersion)"

# Verificar conectividad
if ! check_connectivity; then
    print_error "No se puede continuar sin conexión a GitHub"
    print_info "Revisa la guía TROUBLESHOOTING-2025.md para soluciones"
    exit 1
fi

# Configurar Git
configure_git

# =============================================================================
# 1. INSTALAR HOMEBREW
# =============================================================================

print_header "1. Instalando Homebrew"

if command_exists brew; then
    print_success "Homebrew ya está instalado"
    print_info "Actualizando Homebrew..."
    brew update
else
    print_info "Instalando Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # Configurar PATH para Apple Silicon
    if [[ $(uname -m) == "arm64" ]]; then
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi

    print_success "Homebrew instalado"
fi

# Verificar instalación de Homebrew
if ! command_exists brew; then
    print_error "Homebrew no se instaló correctamente"
    exit 1
fi

# Diagnóstico de Homebrew
print_info "Ejecutando diagnóstico de Homebrew..."
brew doctor || print_warning "Hay algunas advertencias de Homebrew (esto es normal)"

# =============================================================================
# 2. INSTALAR WINDOW MANAGER (YABAI + SKHD) - CON MANEJO DE ERRORES
# =============================================================================

print_header "2. Instalando Window Manager (yabai + skhd)"

install_yabai_skhd() {
    # Método 1: Intentar con Homebrew tap
    print_info "Método 1: Intentando instalación via Homebrew tap..."

    if retry_command brew tap koekeishiya/formulae; then
        print_success "Tap koekeishiya/formulae agregado"

        print_info "Instalando yabai..."
        if retry_command brew install koekeishiya/formulae/yabai; then
            print_success "Yabai instalado via Homebrew"
        else
            print_warning "Falló instalación de yabai via Homebrew, intentando método alternativo..."
            return 1
        fi

        print_info "Instalando skhd..."
        if retry_command brew install koekeishiya/formulae/skhd; then
            print_success "Skhd instalado via Homebrew"
            return 0
        else
            print_warning "Falló instalación de skhd via Homebrew, intentando método alternativo..."
            return 1
        fi
    else
        print_warning "No se pudo agregar tap koekeishiya/formulae"
        return 1
    fi
}

# Intentar instalación via Homebrew
if ! install_yabai_skhd; then
    # Método 2: Instalación manual desde releases
    print_warning "Instalación via Homebrew falló. Intentando instalación manual..."

    print_info "Descargando releases más recientes desde GitHub..."

    cd /tmp
    mkdir -p yabai-skhd-install
    cd yabai-skhd-install

    # Descargar Yabai
    print_info "Descargando yabai..."
    if retry_command curl -L https://github.com/koekeishiya/yabai/releases/latest/download/yabai-$(uname -m).tar.gz -o yabai.tar.gz; then
        tar -xzf yabai.tar.gz
        sudo mkdir -p /usr/local/bin
        sudo mv bin/yabai /usr/local/bin/
        sudo chmod +x /usr/local/bin/yabai
        print_success "Yabai instalado manualmente"
    else
        print_error "No se pudo descargar yabai"
        exit 1
    fi

    # Descargar Skhd
    print_info "Descargando skhd..."
    if retry_command curl -L https://github.com/koekeishiya/skhd/releases/latest/download/skhd-$(uname -m).tar.gz -o skhd.tar.gz; then
        tar -xzf skhd.tar.gz
        sudo mv bin/skhd /usr/local/bin/
        sudo chmod +x /usr/local/bin/skhd
        print_success "Skhd instalado manualmente"
    else
        print_error "No se pudo descargar skhd"
        exit 1
    fi

    cd ~
    rm -rf /tmp/yabai-skhd-install
fi

# Verificar instalación
if ! command_exists yabai; then
    print_error "Yabai no se instaló correctamente"
    exit 1
fi

if ! command_exists skhd; then
    print_error "Skhd no se instaló correctamente"
    exit 1
fi

print_success "Yabai versión: $(yabai --version)"
print_success "Skhd versión: $(skhd --version)"

# =============================================================================
# 3. INSTALAR SKETCHYBAR
# =============================================================================

print_header "3. Instalando SketchyBar"

if retry_command brew tap FelixKratz/formulae; then
    if retry_command brew install sketchybar; then
        print_success "SketchyBar instalado"
    else
        print_warning "SketchyBar no se pudo instalar, pero continuaremos"
    fi
else
    print_warning "No se pudo agregar tap de SketchyBar, saltando..."
fi

# Instalar fuentes necesarias para SketchyBar
print_info "Instalando fuentes..."
brew install --cask font-hack-nerd-font 2>/dev/null || print_warning "No se pudo instalar Hack Nerd Font"
brew install --cask sf-symbols 2>/dev/null || print_warning "No se pudo instalar SF Symbols"

# =============================================================================
# 4. INSTALAR APLICACIONES ESENCIALES
# =============================================================================

print_header "4. Instalando Aplicaciones Esenciales"

essential_apps=(
    "alacritty"     # Terminal moderno
    "neovim"        # Editor
    "tmux"          # Multiplexer
    "git"           # Control de versiones
    "zsh"           # Shell
    "fzf"           # Fuzzy finder
    "ripgrep"       # Búsqueda rápida
    "bat"           # Cat mejorado
    "exa"           # ls mejorado
    "htop"          # Monitor de procesos
    "jq"            # JSON processor
    "wget"          # Descargador
    "tree"          # Visualizador de directorios
)

for app in "${essential_apps[@]}"; do
    print_info "Instalando $app..."
    if brew install "$app" 2>/dev/null; then
        print_success "$app instalado"
    else
        print_warning "$app no se pudo instalar (puede ya estar instalado)"
    fi
done

# =============================================================================
# 5. CONFIGURAR YABAI
# =============================================================================

print_header "5. Configurando Yabai"

# Crear directorio para configuración
mkdir -p ~/.config/yabai

# Crear configuración de yabai
cat > ~/.yabairc << 'EOF'
#!/usr/bin/env sh

# =============================================================================
# YABAI CONFIGURATION - 2025
# =============================================================================

# Cargar scripting addition (requiere SIP deshabilitado)
sudo yabai --load-sa 2>/dev/null || true

# =============================================================================
# GLOBAL SETTINGS
# =============================================================================

# Layout: bsp (binary space partitioning) o float
yabai -m config layout bsp

# Espaciado entre ventanas
yabai -m config top_padding    12
yabai -m config bottom_padding 12
yabai -m config left_padding   12
yabai -m config right_padding  12
yabai -m config window_gap     12

# =============================================================================
# MOUSE SETTINGS
# =============================================================================

# Enfoque sigue al mouse
yabai -m config mouse_follows_focus off
yabai -m config focus_follows_mouse off

# Modificador para mover/redimensionar ventanas con mouse
yabai -m config mouse_modifier fn
yabai -m config mouse_action1 move
yabai -m config mouse_action2 resize

# Colocar mouse en centro de ventana al cambiar de enfoque
yabai -m config mouse_drop_action swap

# =============================================================================
# WINDOW SETTINGS
# =============================================================================

# Ventanas flotantes en el centro
yabai -m config window_placement second_child

# Opacidad de ventanas
yabai -m config window_opacity on
yabai -m config active_window_opacity 1.0
yabai -m config normal_window_opacity 0.95

# Sombras
yabai -m config window_shadow float

# Bordes de ventana (requiere SIP deshabilitado)
yabai -m config window_border on
yabai -m config window_border_width 2
yabai -m config active_window_border_color 0xff81a1c1
yabai -m config normal_window_border_color 0xff3b4252

# =============================================================================
# SPLIT SETTINGS
# =============================================================================

yabai -m config split_ratio 0.50
yabai -m config auto_balance off

# =============================================================================
# STATUS BAR
# =============================================================================

# Espacio para SketchyBar
yabai -m config external_bar all:32:0

# =============================================================================
# RULES - Aplicaciones que deben ser flotantes
# =============================================================================

# Preferencias del sistema
yabai -m rule --add app="^System Settings$" manage=off
yabai -m rule --add app="^System Preferences$" manage=off

# Utilidades
yabai -m rule --add app="^Calculator$" manage=off
yabai -m rule --add app="^Activity Monitor$" manage=off
yabai -m rule --add app="^Dictionary$" manage=off
yabai -m rule --add app="^Archive Utility$" manage=off

# Instaladores
yabai -m rule --add app="^Installer$" manage=off
yabai -m rule --add title="^Software Update$" manage=off

# Diálogos
yabai -m rule --add title="^Preferences$" manage=off
yabai -m rule --add title="^Settings$" manage=off

echo "Yabai configuration loaded"
EOF

chmod +x ~/.yabairc
print_success "Configuración de yabai creada"

# =============================================================================
# 6. CONFIGURAR SKHD
# =============================================================================

print_header "6. Configurando Skhd"

cat > ~/.skhdrc << 'EOF'
# =============================================================================
# SKHD CONFIGURATION - 2025
# Atajos de teclado estilo i3/Hyprland
# =============================================================================

# Tecla modificadora: cmd + shift = ⌘ + ⇧

# =============================================================================
# LANZAR APLICACIONES
# =============================================================================

# Terminal
cmd + shift - return : open -na /Applications/Alacritty.app

# Navegador
cmd + shift - b : open -a "Safari"

# Finder
cmd + shift - e : open -a "Finder"

# =============================================================================
# WINDOW FOCUS (enfoque de ventanas)
# =============================================================================

# Cambiar enfoque entre ventanas
cmd + shift - h : yabai -m window --focus west
cmd + shift - j : yabai -m window --focus south
cmd + shift - k : yabai -m window --focus north
cmd + shift - l : yabai -m window --focus east

# Alternativamente con flechas
cmd + shift - left  : yabai -m window --focus west
cmd + shift - down  : yabai -m window --focus south
cmd + shift - up    : yabai -m window --focus north
cmd + shift - right : yabai -m window --focus east

# =============================================================================
# MOVER VENTANAS
# =============================================================================

# Mover ventanas en el espacio actual
cmd + ctrl + shift - h : yabai -m window --swap west
cmd + ctrl + shift - j : yabai -m window --swap south
cmd + ctrl + shift - k : yabai -m window --swap north
cmd + ctrl + shift - l : yabai -m window --swap east

# Con flechas
cmd + ctrl + shift - left  : yabai -m window --swap west
cmd + ctrl + shift - down  : yabai -m window --swap south
cmd + ctrl + shift - up    : yabai -m window --swap north
cmd + ctrl + shift - right : yabai -m window --swap east

# =============================================================================
# REDIMENSIONAR VENTANAS
# =============================================================================

# Expandir ventana
cmd + alt - h : yabai -m window --resize left:-50:0
cmd + alt - j : yabai -m window --resize bottom:0:50
cmd + alt - k : yabai -m window --resize top:0:-50
cmd + alt - l : yabai -m window --resize right:50:0

# Contraer ventana
cmd + alt + shift - h : yabai -m window --resize left:50:0
cmd + alt + shift - j : yabai -m window --resize bottom:0:-50
cmd + alt + shift - k : yabai -m window --resize top:0:50
cmd + alt + shift - l : yabai -m window --resize right:-50:0

# Balancear todas las ventanas
cmd + shift - 0 : yabai -m space --balance

# =============================================================================
# ESPACIOS DE TRABAJO (WORKSPACES)
# =============================================================================

# Cambiar a workspace
cmd + shift - 1 : yabai -m space --focus 1
cmd + shift - 2 : yabai -m space --focus 2
cmd + shift - 3 : yabai -m space --focus 3
cmd + shift - 4 : yabai -m space --focus 4
cmd + shift - 5 : yabai -m space --focus 5
cmd + shift - 6 : yabai -m space --focus 6

# Mover ventana a workspace
cmd + ctrl + shift - 1 : yabai -m window --space 1; yabai -m space --focus 1
cmd + ctrl + shift - 2 : yabai -m window --space 2; yabai -m space --focus 2
cmd + ctrl + shift - 3 : yabai -m window --space 3; yabai -m space --focus 3
cmd + ctrl + shift - 4 : yabai -m window --space 4; yabai -m space --focus 4
cmd + ctrl + shift - 5 : yabai -m window --space 5; yabai -m space --focus 5
cmd + ctrl + shift - 6 : yabai -m window --space 6; yabai -m space --focus 6

# Workspace siguiente/anterior
cmd + shift - n : yabai -m space --focus next
cmd + shift - p : yabai -m space --focus prev

# =============================================================================
# LAYOUTS
# =============================================================================

# Toggle entre BSP y floating
cmd + shift - space : yabai -m space --layout $(yabai -m query --spaces --space | jq -r 'if .type == "bsp" then "float" else "bsp" end')

# Rotar árbol 90 grados
cmd + shift - r : yabai -m space --rotate 90

# Flip en eje X/Y
cmd + shift - x : yabai -m space --mirror x-axis
cmd + shift - y : yabai -m space --mirror y-axis

# =============================================================================
# VENTANA: TOGGLE ESTADOS
# =============================================================================

# Fullscreen
cmd + shift - f : yabai -m window --toggle zoom-fullscreen

# Nativo fullscreen
cmd + ctrl - f : yabai -m window --toggle native-fullscreen

# Float / Unfloat
cmd + shift - t : yabai -m window --toggle float; yabai -m window --grid 4:4:1:1:2:2

# Split horizontal/vertical
cmd + shift - e : yabai -m window --toggle split

# =============================================================================
# CERRAR VENTANA
# =============================================================================

cmd + shift - q : yabai -m window --close

# =============================================================================
# YABAI CONTROL
# =============================================================================

# Reiniciar yabai
cmd + ctrl + shift - r : yabai --restart-service

# Detener/Iniciar yabai
cmd + ctrl + shift - q : yabai --stop-service
cmd + ctrl + shift - s : yabai --start-service

# =============================================================================
# QUICK ACTIONS
# =============================================================================

# Captura de pantalla
cmd + shift - s : screencapture -i ~/Desktop/screenshot-$(date +%Y%m%d-%H%M%S).png

# Bloquear pantalla
cmd + shift - escape : pmset displaysleepnow
EOF

chmod +x ~/.skhdrc
print_success "Configuración de skhd creada"

# =============================================================================
# 7. CONFIGURAR SERVICIOS
# =============================================================================

print_header "7. Configurando Servicios"

# Crear directorio LaunchAgents si no existe
mkdir -p ~/Library/LaunchAgents

# Instalar servicios (método 2025)
print_info "Instalando servicios de yabai y skhd..."

if command -v yabai &>/dev/null && yabai --install-service 2>/dev/null; then
    print_success "Servicio de yabai instalado"
else
    print_warning "No se pudo instalar servicio de yabai automáticamente"
    print_info "Puede que necesites hacerlo manualmente"
fi

if command -v skhd &>/dev/null && skhd --install-service 2>/dev/null; then
    print_success "Servicio de skhd instalado"
else
    print_warning "No se pudo instalar servicio de skhd automáticamente"
    print_info "Puede que necesites hacerlo manualmente"
fi

# =============================================================================
# 8. CONFIGURAR ZSH
# =============================================================================

print_header "8. Configurando Zsh"

# Backup de .zshrc si existe
if [ -f ~/.zshrc ]; then
    cp ~/.zshrc ~/.zshrc.backup.$(date +%Y%m%d)
    print_info "Backup de .zshrc creado"
fi

# Agregar aliases útiles
cat >> ~/.zshrc << 'EOF'

# =============================================================================
# ARCH-MACOS SETUP - Aliases y Configuración
# =============================================================================

# Aliases estilo Arch
alias ls='exa --icons'
alias ll='exa -la --icons'
alias la='exa -a --icons'
alias lt='exa --tree --icons'
alias cat='bat'
alias vim='nvim'
alias vi='nvim'

# Aliases de sistema
alias update='brew update && brew upgrade && brew cleanup'
alias cleanup='brew cleanup && brew autoremove'

# Aliases de Yabai/Skhd
alias ystart='yabai --start-service'
alias ystop='yabai --stop-service'
alias yrestart='yabai --restart-service'
alias sstart='skhd --start-service'
alias sstop='skhd --stop-service'
alias srestart='skhd --restart-service'

# Git aliases
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git log --oneline --graph'

# Funciones útiles
wm-reload() {
    yabai --restart-service
    skhd --restart-service
    echo "Window manager reloaded"
}

wm-status() {
    echo "=== Yabai ==="
    yabai --check-service
    echo ""
    echo "=== Skhd ==="
    skhd --check-service
}

# Prompt mejorado (si no usas oh-my-zsh)
autoload -U colors && colors
PS1="%{$fg[cyan]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[yellow]%}%~ %{$reset_color%}%% "

EOF

print_success "Zsh configurado"

# =============================================================================
# 9. CONFIGURAR ALACRITTY
# =============================================================================

print_header "9. Configurando Alacritty"

mkdir -p ~/.config/alacritty

cat > ~/.config/alacritty/alacritty.toml << 'EOF'
# Alacritty Configuration - 2025

[window]
opacity = 0.95
decorations = "buttonless"
startup_mode = "Windowed"
dynamic_title = true

[window.padding]
x = 10
y = 10

[font]
size = 13.0

[font.normal]
family = "Hack Nerd Font"
style = "Regular"

[font.bold]
family = "Hack Nerd Font"
style = "Bold"

[font.italic]
family = "Hack Nerd Font"
style = "Italic"

[colors.primary]
background = "#2e3440"
foreground = "#d8dee9"

[colors.normal]
black = "#3b4252"
red = "#bf616a"
green = "#a3be8c"
yellow = "#ebcb8b"
blue = "#81a1c1"
magenta = "#b48ead"
cyan = "#88c0d0"
white = "#e5e9f0"

[colors.bright]
black = "#4c566a"
red = "#bf616a"
green = "#a3be8c"
yellow = "#ebcb8b"
blue = "#81a1c1"
magenta = "#b48ead"
cyan = "#8fbcbb"
white = "#eceff4"

[cursor]
style = "Block"
unfocused_hollow = true

[[keyboard.bindings]]
key = "Return"
mods = "Command|Shift"
action = "SpawnNewInstance"
EOF

print_success "Alacritty configurado"

# =============================================================================
# 10. INFORMACIÓN FINAL
# =============================================================================

print_header "10. ¡Instalación Completada!"

echo ""
print_success "Setup Arch-like macOS instalado correctamente"
echo ""

print_warning "PASOS IMPORTANTES A CONTINUACIÓN:"
echo ""
echo "1. 🔐 PERMISOS DE ACCESIBILIDAD"
echo "   Ve a: Configuración del Sistema > Privacidad y Seguridad > Accesibilidad"
echo "   Agrega y habilita:"
echo "   • yabai"
echo "   • skhd"
echo "   • tu aplicación de Terminal (Alacritty/iTerm2/Terminal)"
echo ""

echo "2. 🚀 INICIAR SERVICIOS"
echo "   Ejecuta:"
echo "   $ yabai --start-service"
echo "   $ skhd --start-service"
echo ""

echo "3. 📝 ARCHIVOS DE CONFIGURACIÓN"
echo "   • ~/.yabairc  (configuración de yabai)"
echo "   • ~/.skhdrc   (atajos de teclado)"
echo "   • ~/.config/alacritty/alacritty.toml"
echo ""

echo "4. ⌨️  ATAJOS DE TECLADO PRINCIPALES"
echo "   • Cmd+Shift+Return : Abrir terminal"
echo "   • Cmd+Shift+H/J/K/L : Cambiar enfoque de ventana"
echo "   • Cmd+Shift+1-6 : Cambiar de workspace"
echo "   • Cmd+Shift+F : Fullscreen"
echo "   • Cmd+Shift+Q : Cerrar ventana"
echo "   • Cmd+Shift+R : Rotar layout"
echo ""

echo "5. 🛠️  COMANDOS ÚTILES"
echo "   $ wm-status   : Ver estado de servicios"
echo "   $ wm-reload   : Recargar configuración"
echo "   $ update      : Actualizar todo con Homebrew"
echo ""

echo "6. 📚 DOCUMENTACIÓN"
echo "   • README-SETUP.md - Guía de inicio rápido"
echo "   • TROUBLESHOOTING-2025.md - Solución de problemas"
echo "   • arch-macos-setup-2025.md - Guía completa"
echo "   • sales-workflow-cli-guide.md - Comandos para ventas"
echo ""

echo "7. ⚠️  OPCIONAL: DESHABILITAR SIP"
echo "   Para funciones avanzadas de yabai (bordes, opacidad, etc.):"
echo "   • Reinicia en Recovery Mode (Cmd+R al encender)"
echo "   • Terminal > csrutil disable"
echo "   • Reinicia normalmente"
echo "   • Ejecuta: sudo yabai --load-sa"
echo ""

print_warning "Si encuentras problemas, consulta: TROUBLESHOOTING-2025.md"
echo ""

print_info "Reinicia tu terminal o ejecuta: source ~/.zshrc"
echo ""

# Crear script de inicio rápido
cat > ~/start-wm.sh << 'EOF'
#!/bin/bash
yabai --start-service
skhd --start-service
sketchybar 2>/dev/null &
echo "Window Manager iniciado"
EOF
chmod +x ~/start-wm.sh

print_success "Script de inicio creado: ~/start-wm.sh"
echo ""

print_header "¡Disfruta tu nuevo setup! 🎉"
