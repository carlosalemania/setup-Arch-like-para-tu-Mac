#!/bin/bash
# Script de instalación de temas btop épicos

# Colores
GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${CYAN}"
echo "╔══════════════════════════════════════════════════════╗"
echo "║                                                      ║"
echo "║    🚀 INSTALADOR DE TEMAS BTOP ÉPICOS 🚀           ║"
echo "║                                                      ║"
echo "╚══════════════════════════════════════════════════════╝"
echo -e "${NC}\n"

# Verificar si btop está instalado
if ! command -v btop &> /dev/null; then
    echo -e "${RED}❌ btop no está instalado${NC}"
    echo -e "${YELLOW}💡 Instálalo con: ${NC}brew install btop\n"
    exit 1
fi

echo -e "${GREEN}✅ btop encontrado${NC}\n"

# Directorios
THEMES_DIR="$HOME/btop-themes-custom"
BTOP_CONFIG_DIR="$HOME/.config/btop"
BTOP_THEMES_DIR="$BTOP_CONFIG_DIR/themes"

# Verificar permisos
if [ ! -w "$HOME/.config" ] 2>/dev/null; then
    echo -e "${YELLOW}⚙️  Arreglando permisos de ~/.config...${NC}"
    sudo chown -R $USER:staff ~/.config
fi

# Crear directorios
echo -e "${CYAN}📁 Creando directorios...${NC}"
mkdir -p "$BTOP_CONFIG_DIR" 2>/dev/null
mkdir -p "$BTOP_THEMES_DIR" 2>/dev/null

# Copiar temas
echo -e "${CYAN}🎨 Instalando temas...${NC}"
cp "$THEMES_DIR"/*.theme "$BTOP_THEMES_DIR/" 2>/dev/null

# Copiar configuración si no existe
if [ ! -f "$BTOP_CONFIG_DIR/btop.conf" ]; then
    echo -e "${CYAN}⚙️  Instalando configuración base...${NC}"
    cp "$THEMES_DIR/btop.conf" "$BTOP_CONFIG_DIR/"
else
    echo -e "${YELLOW}ℹ️  Configuración existente encontrada, no se sobrescribirá${NC}"
fi

# Crear alias en shell
SHELL_RC=""
if [ -f "$HOME/.zshrc" ]; then
    SHELL_RC="$HOME/.zshrc"
elif [ -f "$HOME/.bashrc" ]; then
    SHELL_RC="$HOME/.bashrc"
elif [ -f "$HOME/.config/fish/config.fish" ]; then
    SHELL_RC="$HOME/.config/fish/config.fish"
fi

if [ ! -z "$SHELL_RC" ]; then
    if ! grep -q "btop-theme" "$SHELL_RC" 2>/dev/null; then
        echo -e "\n${CYAN}🔧 Agregando alias a $SHELL_RC...${NC}"
        echo "" >> "$SHELL_RC"
        echo "# btop theme switcher" >> "$SHELL_RC"
        if [[ "$SHELL_RC" == *"fish"* ]]; then
            echo "alias btop-theme '$THEMES_DIR/btop-theme-switcher.sh'" >> "$SHELL_RC"
        else
            echo "alias btop-theme='$THEMES_DIR/btop-theme-switcher.sh'" >> "$SHELL_RC"
        fi
    fi
fi

echo -e "\n${GREEN}╔══════════════════════════════════════════════════════╗"
echo "║                                                      ║"
echo "║          ✅ INSTALACIÓN COMPLETADA ✅               ║"
echo "║                                                      ║"
echo "╚══════════════════════════════════════════════════════╝${NC}\n"

echo -e "${CYAN}Temas instalados:${NC}"
echo "  🎨 Dracula Premium"
echo "  🌈 Cyberpunk Neon"
echo "  🌃 Tokyo Night Storm"
echo "  💚 Matrix Hacker"
echo ""

echo -e "${YELLOW}Comandos disponibles:${NC}"
echo "  ${WHITE}btop-theme${NC}     - Cambiar tema (menú interactivo)"
echo "  ${WHITE}btop${NC}           - Ejecutar btop"
echo ""

echo -e "${CYAN}💡 Reinicia tu terminal o ejecuta:${NC}"
echo "  ${WHITE}source $SHELL_RC${NC}"
echo ""

echo -e "${GREEN}🚀 ¡Disfruta tus temas épicos!${NC}\n"
