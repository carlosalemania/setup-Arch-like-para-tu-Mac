#!/bin/bash
# btop Theme Switcher - Cambiador de Temas Épico
# Usa este script para cambiar entre temas según tu mood

# Colores para el menú
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
NC='\033[0m' # Sin color

# Directorios
THEMES_DIR="$HOME/btop-themes-custom"
BTOP_CONFIG_DIR="$HOME/.config/btop"
BTOP_THEMES_DIR="$BTOP_CONFIG_DIR/themes"

# Banner épico
show_banner() {
    clear
    echo -e "${CYAN}"
    echo "╔══════════════════════════════════════════════════════╗"
    echo "║                                                      ║"
    echo "║           🎨 BTOP THEME SWITCHER 🎨                 ║"
    echo "║                                                      ║"
    echo "║         Cambia tu mood, cambia tu theme!            ║"
    echo "║                                                      ║"
    echo "╚══════════════════════════════════════════════════════╝"
    echo -e "${NC}"
}

# Mostrar temas disponibles
show_themes() {
    echo -e "\n${YELLOW}═══ Temas Disponibles ═══${NC}\n"

    echo -e "${MAGENTA}1)${NC} ${WHITE}Dracula Premium${NC}"
    echo -e "   └─ Oscuro vibrante con neones rosas/púrpuras"
    echo -e "   └─ Perfecto para: Trabajo nocturno, coding sessions largas"
    echo ""

    echo -e "${CYAN}2)${NC} ${WHITE}Cyberpunk Neon${NC}"
    echo -e "   └─ Ultra brillante, colores neón extremos"
    echo -e "   └─ Perfecto para: Sentirte hacker, impresionar amigos"
    echo ""

    echo -e "${BLUE}3)${NC} ${WHITE}Tokyo Night Storm${NC}"
    echo -e "   └─ Azules profundos con acentos suaves"
    echo -e "   └─ Perfecto para: Trabajo profesional, elegancia"
    echo ""

    echo -e "${GREEN}4)${NC} ${WHITE}Matrix Hacker${NC}"
    echo -e "   └─ Verde Matrix puro, modo Neo"
    echo -e "   └─ Perfecto para: Sentirte en The Matrix"
    echo ""

    echo -e "${RED}5)${NC} ${WHITE}Salir${NC}"
    echo ""
}

# Aplicar tema
apply_theme() {
    local theme_file=$1
    local theme_name=$2

    echo -e "\n${YELLOW}⚙️  Aplicando tema: ${WHITE}$theme_name${NC}"

    # Copiar tema
    cp "$THEMES_DIR/$theme_file" "$BTOP_THEMES_DIR/" 2>/dev/null

    # Actualizar configuración
    if [ -f "$BTOP_CONFIG_DIR/btop.conf" ]; then
        sed -i.bak "s/^color_theme = .*/color_theme = \"${theme_file%.theme}\"/" "$BTOP_CONFIG_DIR/btop.conf"
    else
        cp "$THEMES_DIR/btop.conf" "$BTOP_CONFIG_DIR/"
        sed -i.bak "s/^color_theme = .*/color_theme = \"${theme_file%.theme}\"/" "$BTOP_CONFIG_DIR/btop.conf"
    fi

    echo -e "${GREEN}✅ Tema aplicado exitosamente!${NC}"
    echo -e "${CYAN}💡 Reinicia btop para ver los cambios${NC}\n"

    sleep 2
}

# Setup inicial
setup_dirs() {
    # Crear directorios si no existen
    mkdir -p "$BTOP_THEMES_DIR" 2>/dev/null

    # Si .config/btop es propiedad de root, avisar
    if [ ! -w "$BTOP_CONFIG_DIR" ]; then
        echo -e "${RED}⚠️  ATENCIÓN: No tienes permisos de escritura en $BTOP_CONFIG_DIR${NC}"
        echo -e "${YELLOW}Ejecuta: ${WHITE}sudo chown -R $USER:staff ~/.config/btop${NC}\n"
        read -p "Presiona Enter para continuar..."
    fi
}

# Menú principal
main_menu() {
    while true; do
        show_banner
        show_themes

        echo -n -e "${CYAN}Selecciona un tema [1-5]: ${NC}"
        read -r choice

        case $choice in
            1)
                apply_theme "dracula-premium.theme" "Dracula Premium"
                ;;
            2)
                apply_theme "cyberpunk-neon.theme" "Cyberpunk Neon"
                ;;
            3)
                apply_theme "tokyo-night-storm.theme" "Tokyo Night Storm"
                ;;
            4)
                apply_theme "matrix-hacker.theme" "Matrix Hacker"
                ;;
            5)
                echo -e "\n${CYAN}👋 ¡Hasta luego!${NC}\n"
                exit 0
                ;;
            *)
                echo -e "\n${RED}❌ Opción inválida. Intenta de nuevo.${NC}\n"
                sleep 1
                ;;
        esac
    done
}

# Iniciar script
setup_dirs
main_menu
