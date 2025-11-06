#!/bin/bash

# 🎨 INSTALADOR AUTOMÁTICO DE TEMAS ÉPICOS
# Setup Arch-like para macOS
# Por: Carlos Alemania

set -e  # Salir si hay errores

echo "╔════════════════════════════════════════════════════════════╗"
echo "║   🎨 INSTALADOR DE TEMAS NEÓN - Setup Arch-like macOS     ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo ""

# Colores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Función de log
log_info() {
    echo -e "${CYAN}ℹ${NC}  $1"
}

log_success() {
    echo -e "${GREEN}✓${NC}  $1"
}

log_warning() {
    echo -e "${YELLOW}⚠${NC}  $1"
}

log_error() {
    echo -e "${RED}✗${NC}  $1"
}

# Verificar que estamos en el directorio correcto
if [ ! -d "configs" ]; then
    log_error "Directorio 'configs' no encontrado"
    log_info "Ejecuta este script desde el directorio raíz del repositorio"
    exit 1
fi

echo ""
log_info "Iniciando instalación de configuraciones..."
echo ""

# ============================================
# 1. JANKYBORDERS (Bordes Rosa Neón)
# ============================================
echo -e "${MAGENTA}━━━ 🔥 Instalando JankyBorders ━━━${NC}"

if ! command -v borders &> /dev/null; then
    log_info "Instalando JankyBorders..."
    brew tap FelixKratz/formulae 2>/dev/null || true
    brew install borders
    log_success "JankyBorders instalado"
else
    log_success "JankyBorders ya está instalado"
fi

# Copiar configuración
log_info "Copiando configuración de borders..."
mkdir -p ~/.config/borders
cp configs/borders/bordersrc ~/.config/borders/
chmod +x ~/.config/borders/bordersrc
log_success "Configuración de borders copiada"

# Iniciar servicio
log_info "Iniciando servicio de borders..."
brew services start borders 2>/dev/null || brew services restart borders
log_success "Servicio de borders iniciado"

echo ""

# ============================================
# 2. YABAI
# ============================================
echo -e "${MAGENTA}━━━ 🪟 Configurando Yabai ━━━${NC}"

if [ -f "configs/yabai/yabairc" ]; then
    log_info "Copiando configuración de yabai..."
    mkdir -p ~/.config/yabai

    # Backup de config anterior si existe
    if [ -f ~/.config/yabai/yabairc ]; then
        cp ~/.config/yabai/yabairc ~/.config/yabai/yabairc.backup
        log_info "Backup creado: ~/.config/yabai/yabairc.backup"
    fi

    cp configs/yabai/yabairc ~/.config/yabai/
    chmod +x ~/.config/yabai/yabairc
    log_success "Configuración de yabai actualizada"

    # Reiniciar yabai si está corriendo
    if pgrep -x yabai > /dev/null; then
        log_info "Reiniciando yabai..."
        yabai --restart-service
        log_success "Yabai reiniciado"
    fi
else
    log_warning "Archivo yabairc no encontrado, saltando..."
fi

echo ""

# ============================================
# 3. BTOP (Monitor del Sistema)
# ============================================
echo -e "${MAGENTA}━━━ 📊 Instalando btop y temas ━━━${NC}"

if ! command -v btop &> /dev/null; then
    log_info "Instalando btop..."
    brew install btop
    log_success "btop instalado"
else
    log_success "btop ya está instalado"
fi

# Copiar configuración y temas
log_info "Copiando configuración de btop..."
mkdir -p ~/.config/btop/themes

cp configs/btop/btop.conf ~/.config/btop/
log_success "Configuración btop copiada"

log_info "Copiando 4 temas épicos..."
cp configs/btop/themes/*.theme ~/.config/btop/themes/
log_success "Temas btop instalados:"
echo "   • Dracula Premium"
echo "   • Cyberpunk Neon"
echo "   • Tokyo Night Storm"
echo "   • Matrix Hacker"

# Copiar scripts
if [ -d "configs/btop/scripts" ]; then
    log_info "Copiando scripts de btop..."
    cp configs/btop/scripts/*.sh ~/
    chmod +x ~/*-theme*.sh ~/install-themes.sh 2>/dev/null || true
    log_success "Scripts copiados al home"
fi

echo ""

# ============================================
# 4. WARP TERMINAL
# ============================================
echo -e "${MAGENTA}━━━ 🖥️  Instalando temas Warp ━━━${NC}"

log_info "Copiando temas de Warp Terminal..."
mkdir -p ~/.warp/themes
cp configs/warp-themes/*.yaml ~/.warp/themes/
log_success "Temas Warp instalados:"
echo "   • Neon Fire Tokyo"
echo "   • Cyberpunk Fire"

echo ""

# ============================================
# 5. ALIASES (opcional)
# ============================================
echo -e "${MAGENTA}━━━ ⚡ Configurando aliases ━━━${NC}"

# Detectar shell
if [ -n "$ZSH_VERSION" ]; then
    SHELL_RC="$HOME/.zshrc"
elif [ -n "$BASH_VERSION" ]; then
    SHELL_RC="$HOME/.bashrc"
else
    SHELL_RC="$HOME/.zshrc"  # Default
fi

log_info "Agregando alias al $SHELL_RC..."

# Verificar si los alias ya existen
if ! grep -q "btop-theme" "$SHELL_RC" 2>/dev/null; then
    cat >> "$SHELL_RC" << 'EOF'

# ═══════════════════════════════════════════
# 🎨 Temas Neón - Aliases
# ═══════════════════════════════════════════

# btop theme switcher
alias btop-theme='~/btop-theme-switcher.sh'

# Cambiar temas btop rápido
alias theme-cyber='sed -i "" "s/color_theme = .*/color_theme = \"cyberpunk-neon\"/" ~/.config/btop/btop.conf'
alias theme-dracula='sed -i "" "s/color_theme = .*/color_theme = \"dracula-premium\"/" ~/.config/btop/btop.conf'
alias theme-tokyo='sed -i "" "s/color_theme = .*/color_theme = \"tokyo-night-storm\"/" ~/.config/btop/btop.conf'
alias theme-matrix='sed -i "" "s/color_theme = .*/color_theme = \"matrix-hacker\"/" ~/.config/btop/btop.conf'

# Borders management
alias borders-restart='brew services restart borders'
alias borders-stop='brew services stop borders'
alias borders-start='brew services start borders'
alias borders-status='brew services list | grep borders'

EOF
    log_success "Aliases agregados a $SHELL_RC"
else
    log_info "Aliases ya existen en $SHELL_RC"
fi

echo ""

# ============================================
# RESUMEN
# ============================================
echo ""
echo "╔════════════════════════════════════════════════════════════╗"
echo "║              ✅ INSTALACIÓN COMPLETADA                     ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo ""
echo -e "${GREEN}🎉 Todas las configuraciones han sido instaladas exitosamente!${NC}"
echo ""
echo -e "${CYAN}📋 Próximos pasos:${NC}"
echo ""
echo "1. 🔥 Bordes Rosa Neón:"
echo "   Los bordes ya deberían estar activos"
echo "   Personalizar: ~/.config/borders/bordersrc"
echo ""
echo "2. 🖥️  Warp Terminal:"
echo "   • Reinicia Warp Terminal (Cmd+Q)"
echo "   • Cmd+, → Appearance → Themes"
echo "   • Selecciona: 'neon-fire-tokyo' o 'cyberpunk-fire'"
echo ""
echo "3. 📊 btop:"
echo "   • Ejecuta: btop"
echo "   • Presiona 't' para cambiar tema"
echo "   • O usa: btop-theme (alias)"
echo ""
echo "4. ⚡ Aliases:"
echo "   • Recarga tu shell: source $SHELL_RC"
echo "   • Prueba: theme-cyber, theme-dracula, etc."
echo ""
echo -e "${YELLOW}⚠️  Importante:${NC}"
echo "   • Verifica que borders tenga permisos de Accesibilidad"
echo "   • System Settings → Privacy → Accessibility"
echo "   • Agrega 'borders' a la lista"
echo ""
echo -e "${MAGENTA}🎨 Disfruta tus temas neón épicos!${NC}"
echo ""
echo "Documentación completa: THEMES-GUIDE.md"
echo "Ayuda: https://github.com/carlosalemania/setup-Arch-like-para-tu-Mac"
echo ""
