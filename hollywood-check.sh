#!/bin/bash
# hollywood-check.sh - Verificar estado de las herramientas Hollywood

GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

clear
echo -e "${BLUE}"
cat << "EOF"
╔════════════════════════════════════════════════════════════╗
║                                                            ║
║       🔍 HOLLYWOOD TOOLS - STATUS CHECK 🔍                 ║
║                                                            ║
╚════════════════════════════════════════════════════════════╝
EOF
echo -e "${NC}"

check_tool() {
    local tool=$1
    local description=$2
    local priority=$3  # ⭐=essential, ⚡=recommended, 💎=optional

    if command -v "$tool" &> /dev/null; then
        echo -e "${GREEN}✓${NC} $priority $tool - $description"
        return 0
    else
        echo -e "${RED}✗${NC} $priority $tool - $description ${YELLOW}(no instalado)${NC}"
        return 1
    fi
}

# Contadores
INSTALLED=0
MISSING=0
TOTAL=0

echo -e "${BLUE}═══════════════════════════════════════════════════════════${NC}"
echo -e "${BLUE}  HERRAMIENTAS ESENCIALES${NC}"
echo -e "${BLUE}═══════════════════════════════════════════════════════════${NC}"
echo ""

check_tool "brew" "Package manager" "⭐" && ((INSTALLED++)) || ((MISSING++)); ((TOTAL++))
check_tool "cmatrix" "Matrix effect" "⭐" && ((INSTALLED++)) || ((MISSING++)); ((TOTAL++))
check_tool "htop" "Process monitor" "⭐" && ((INSTALLED++)) || ((MISSING++)); ((TOTAL++))
check_tool "git" "Version control" "⭐" && ((INSTALLED++)) || ((MISSING++)); ((TOTAL++))

echo ""
echo -e "${BLUE}═══════════════════════════════════════════════════════════${NC}"
echo -e "${BLUE}  MONITOREO DE SISTEMA${NC}"
echo -e "${BLUE}═══════════════════════════════════════════════════════════${NC}"
echo ""

check_tool "btop" "Visual system monitor" "⚡" && ((INSTALLED++)) || ((MISSING++)); ((TOTAL++))
check_tool "glances" "All-in-one monitor" "⚡" && ((INSTALLED++)) || ((MISSING++)); ((TOTAL++))
check_tool "bottom" "System monitor (Rust)" "💎" && ((INSTALLED++)) || ((MISSING++)); ((TOTAL++))
check_tool "procs" "Modern ps" "💎" && ((INSTALLED++)) || ((MISSING++)); ((TOTAL++))

echo ""
echo -e "${BLUE}═══════════════════════════════════════════════════════════${NC}"
echo -e "${BLUE}  MONITOREO DE RED${NC}"
echo -e "${BLUE}═══════════════════════════════════════════════════════════${NC}"
echo ""

check_tool "nmap" "Network scanner" "⚡" && ((INSTALLED++)) || ((MISSING++)); ((TOTAL++))
check_tool "bmon" "Bandwidth monitor" "⚡" && ((INSTALLED++)) || ((MISSING++)); ((TOTAL++))
check_tool "iftop" "Network traffic" "⚡" && ((INSTALLED++)) || ((MISSING++)); ((TOTAL++))
check_tool "nethogs" "Net usage by process" "💎" && ((INSTALLED++)) || ((MISSING++)); ((TOTAL++))
check_tool "bandwhich" "Advanced net monitor" "💎" && ((INSTALLED++)) || ((MISSING++)); ((TOTAL++))
check_tool "gping" "Visual ping" "💎" && ((INSTALLED++)) || ((MISSING++)); ((TOTAL++))
check_tool "speedtest-cli" "Speed test" "💎" && ((INSTALLED++)) || ((MISSING++)); ((TOTAL++))

echo ""
echo -e "${BLUE}═══════════════════════════════════════════════════════════${NC}"
echo -e "${BLUE}  DISCO Y ALMACENAMIENTO${NC}"
echo -e "${BLUE}═══════════════════════════════════════════════════════════${NC}"
echo ""

check_tool "duf" "Disk usage viewer" "⚡" && ((INSTALLED++)) || ((MISSING++)); ((TOTAL++))
check_tool "ncdu" "Interactive disk analyzer" "⚡" && ((INSTALLED++)) || ((MISSING++)); ((TOTAL++))
check_tool "dust" "du + rust" "💎" && ((INSTALLED++)) || ((MISSING++)); ((TOTAL++))

echo ""
echo -e "${BLUE}═══════════════════════════════════════════════════════════${NC}"
echo -e "${BLUE}  LOGS Y DEBUGGING${NC}"
echo -e "${BLUE}═══════════════════════════════════════════════════════════${NC}"
echo ""

check_tool "lnav" "Log navigator" "⚡" && ((INSTALLED++)) || ((MISSING++)); ((TOTAL++))
check_tool "bat" "cat with highlighting" "💎" && ((INSTALLED++)) || ((MISSING++)); ((TOTAL++))
check_tool "jq" "JSON processor" "⚡" && ((INSTALLED++)) || ((MISSING++)); ((TOTAL++))
check_tool "fx" "Interactive JSON" "💎" && ((INSTALLED++)) || ((MISSING++)); ((TOTAL++))

echo ""
echo -e "${BLUE}═══════════════════════════════════════════════════════════${NC}"
echo -e "${BLUE}  DOCKER${NC}"
echo -e "${BLUE}═══════════════════════════════════════════════════════════${NC}"
echo ""

check_tool "docker" "Docker engine" "💎" && ((INSTALLED++)) || ((MISSING++)); ((TOTAL++))
check_tool "lazydocker" "Docker TUI" "💎" && ((INSTALLED++)) || ((MISSING++)); ((TOTAL++))
check_tool "ctop" "Container monitor" "💎" && ((INSTALLED++)) || ((MISSING++)); ((TOTAL++))

echo ""
echo -e "${BLUE}═══════════════════════════════════════════════════════════${NC}"
echo -e "${BLUE}  GIT${NC}"
echo -e "${BLUE}═══════════════════════════════════════════════════════════${NC}"
echo ""

check_tool "tig" "Text interface for Git" "💎" && ((INSTALLED++)) || ((MISSING++)); ((TOTAL++))
check_tool "lazygit" "Simple Git TUI" "💎" && ((INSTALLED++)) || ((MISSING++)); ((TOTAL++))

echo ""
echo -e "${BLUE}═══════════════════════════════════════════════════════════${NC}"
echo -e "${BLUE}  EFECTOS Y DIVERSIÓN${NC}"
echo -e "${BLUE}═══════════════════════════════════════════════════════════${NC}"
echo ""

check_tool "figlet" "ASCII art text" "💎" && ((INSTALLED++)) || ((MISSING++)); ((TOTAL++))
check_tool "lolcat" "Rainbow colors" "💎" && ((INSTALLED++)) || ((MISSING++)); ((TOTAL++))
check_tool "cowsay" "ASCII cow" "💎" && ((INSTALLED++)) || ((MISSING++)); ((TOTAL++))
check_tool "fortune" "Random quotes" "💎" && ((INSTALLED++)) || ((MISSING++)); ((TOTAL++))
check_tool "asciiquarium" "ASCII aquarium" "💎" && ((INSTALLED++)) || ((MISSING++)); ((TOTAL++))

echo ""
echo -e "${BLUE}═══════════════════════════════════════════════════════════${NC}"
echo -e "${BLUE}  HARDWARE Y TEMPERATURA${NC}"
echo -e "${BLUE}═══════════════════════════════════════════════════════════${NC}"
echo ""

check_tool "osx-cpu-temp" "CPU temperature" "💎" && ((INSTALLED++)) || ((MISSING++)); ((TOTAL++))
check_tool "m-cli" "macOS utilities" "💎" && ((INSTALLED++)) || ((MISSING++)); ((TOTAL++))

echo ""
echo -e "${BLUE}═══════════════════════════════════════════════════════════${NC}"
echo -e "${BLUE}  WINDOW MANAGEMENT${NC}"
echo -e "${BLUE}═══════════════════════════════════════════════════════════${NC}"
echo ""

check_tool "yabai" "Tiling window manager" "💎" && ((INSTALLED++)) || ((MISSING++)); ((TOTAL++))
check_tool "skhd" "Hotkey daemon" "💎" && ((INSTALLED++)) || ((MISSING++)); ((TOTAL++))

echo ""
echo -e "${BLUE}═══════════════════════════════════════════════════════════${NC}"
echo -e "${BLUE}  RESUMEN${NC}"
echo -e "${BLUE}═══════════════════════════════════════════════════════════${NC}"
echo ""

PERCENTAGE=$((INSTALLED * 100 / TOTAL))

echo -e "  Total de herramientas: ${BLUE}$TOTAL${NC}"
echo -e "  ${GREEN}✓${NC} Instaladas: ${GREEN}$INSTALLED${NC}"
echo -e "  ${RED}✗${NC} Faltantes: ${RED}$MISSING${NC}"
echo -e "  Completado: ${YELLOW}$PERCENTAGE%${NC}"
echo ""

if [ $PERCENTAGE -eq 100 ]; then
    echo -e "${GREEN}  🎉 ¡Todo instalado! Estás listo para Hollywood Mode${NC}"
elif [ $PERCENTAGE -ge 70 ]; then
    echo -e "${GREEN}  ✨ Muy bien! Tienes la mayoría de herramientas${NC}"
elif [ $PERCENTAGE -ge 40 ]; then
    echo -e "${YELLOW}  ⚠️  Necesitas instalar más herramientas${NC}"
else
    echo -e "${RED}  ❌ Ejecuta ./hollywood-install-tools.sh${NC}"
fi

echo ""
echo -e "${BLUE}═══════════════════════════════════════════════════════════${NC}"
echo -e "${BLUE}  SCRIPTS HOLLYWOOD DISPONIBLES${NC}"
echo -e "${BLUE}═══════════════════════════════════════════════════════════${NC}"
echo ""

check_script() {
    local script=$1
    local description=$2

    if [ -f "$script" ] && [ -x "$script" ]; then
        echo -e "${GREEN}✓${NC} $script - $description"
    else
        echo -e "${RED}✗${NC} $script - $description"
    fi
}

check_script "./hollywood-install-tools.sh" "Instalador de herramientas"
check_script "./hollywood-mac.sh" "Versión básica (5-6 ventanas)"
check_script "./hollywood-pro.sh" "Versión PRO (10 ventanas)"
check_script "./hollywood-ultimate.sh" "Versión ULTIMATE (6-20+ ventanas)"
check_script "./hollywood-stop.sh" "Detener procesos"
check_script "./hollywood-check.sh" "Este script"

echo ""
echo -e "${BLUE}═══════════════════════════════════════════════════════════${NC}"
echo -e "${BLUE}  PRÓXIMOS PASOS${NC}"
echo -e "${BLUE}═══════════════════════════════════════════════════════════${NC}"
echo ""

if [ $MISSING -gt 0 ]; then
    echo -e "${YELLOW}1.${NC} Instalar herramientas faltantes:"
    echo -e "   ${BLUE}./hollywood-install-tools.sh${NC}"
    echo ""
fi

echo -e "${YELLOW}2.${NC} Ejecutar Hollywood Mode:"
echo -e "   ${BLUE}./hollywood-ultimate.sh${NC}  ${GREEN}(Recomendado)${NC}"
echo -e "   ${BLUE}./hollywood-pro.sh${NC}"
echo -e "   ${BLUE}./hollywood-mac.sh${NC}"
echo ""

echo -e "${YELLOW}3.${NC} Ver documentación:"
echo -e "   ${BLUE}cat HOLLYWOOD-README.md${NC}"
echo -e "   ${BLUE}cat HOLLYWOOD-TOOLS-REFERENCE.md${NC}"
echo ""

echo -e "${YELLOW}4.${NC} Detener Hollywood Mode:"
echo -e "   ${BLUE}./hollywood-stop.sh${NC}"
echo ""

echo -e "${GREEN}🎬 ¡Listo para tu experiencia Hollywood! 🎭${NC}"
echo ""
