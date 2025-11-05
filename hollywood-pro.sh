#!/bin/bash
# hollywood-pro.sh - Efecto Hollywood PRO para macOS
# Versión mejorada con más efectos y controles

set -e

GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${BLUE}🎬 HOLLYWOOD MODE PRO${NC}"
echo "================================"

# Función para verificar e instalar dependencias
install_if_missing() {
    local tool=$1
    if ! command -v "$tool" &> /dev/null; then
        echo -e "${YELLOW}⚠️  Instalando $tool...${NC}"
        brew install "$tool"
    else
        echo -e "${GREEN}✓ $tool ya está instalado${NC}"
    fi
}

# Verificar dependencias
echo -e "\n${BLUE}Verificando herramientas...${NC}"
install_if_missing cmatrix
install_if_missing htop
install_if_missing nettop

# Opcionales pero recomendadas
echo -e "\n${BLUE}Verificando herramientas opcionales...${NC}"
if ! command -v glances &> /dev/null; then
    echo -e "${YELLOW}💡 glances (monitor avanzado) no está instalado${NC}"
    read -p "¿Deseas instalarlo? (s/n) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Ss]$ ]]; then
        brew install glances
    fi
fi

if ! command -v speedtest-cli &> /dev/null; then
    echo -e "${YELLOW}💡 speedtest-cli no está instalado${NC}"
    read -p "¿Deseas instalarlo? (s/n) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Ss]$ ]]; then
        brew install speedtest-cli
    fi
fi

echo -e "\n${GREEN}🚀 Lanzando Hollywood Mode...${NC}\n"
sleep 1

# 1. Efecto Matrix (cmatrix)
osascript -e 'tell application "Terminal" to do script "cmatrix -b -C green"' &
sleep 0.3

# 2. Monitor de procesos (htop)
osascript -e 'tell application "Terminal" to do script "htop"' &
sleep 0.3

# 3. Logs del sistema en tiempo real
osascript -e 'tell application "Terminal" to do script "log stream --predicate \"eventMessage contains[cd] \\\"\\\"\" --style syslog --color always | grep --color=always -E \"error|warn|fail|success|INFO|ERROR|WARN|$\""' &
sleep 0.3

# 4. Monitor de red (nettop)
osascript -e 'tell application "Terminal" to do script "nettop -m tcp"' &
sleep 0.3

# 5. Actividad de disco
osascript -e 'tell application "Terminal" to do script "while true; do clear; echo \"═══════════════════════════════════\"; echo \"  💾 DISK ACTIVITY MONITOR\"; echo \"═══════════════════════════════════\"; df -h | grep -E \"^/dev|Filesystem\"; echo \"\"; iostat -w 2; done"' &
sleep 0.3

# 6. Monitor de memoria
osascript -e 'tell application "Terminal" to do script "while true; do clear; echo \"═══════════════════════════════════\"; echo \"  🧠 MEMORY MONITOR\"; echo \"═══════════════════════════════════\"; vm_stat; echo \"\"; top -l 1 -s 0 | head -n 10; sleep 2; done"' &
sleep 0.3

# 7. Glances (si está instalado)
if command -v glances &> /dev/null; then
    osascript -e 'tell application "Terminal" to do script "glances"' &
    sleep 0.3
fi

# 8. Monitor de procesos con ps
osascript -e 'tell application "Terminal" to do script "while true; do clear; echo \"═══════════════════════════════════\"; echo \"  ⚙️  PROCESS MONITOR\"; echo \"═══════════════════════════════════\"; ps aux | head -n 20; sleep 2; done"' &
sleep 0.3

# 9. Ping monitor (conectividad)
osascript -e 'tell application "Terminal" to do script "while true; do clear; echo \"═══════════════════════════════════\"; echo \"  🌐 NETWORK CONNECTIVITY\"; echo \"═══════════════════════════════════\"; ping -c 3 8.8.8.8; echo \"\"; ping -c 3 1.1.1.1; sleep 3; done"' &
sleep 0.3

# 10. Monitor de temperatura (si osx-cpu-temp está disponible)
if command -v osx-cpu-temp &> /dev/null; then
    osascript -e 'tell application "Terminal" to do script "while true; do clear; echo \"═══════════════════════════════════\"; echo \"  🌡️  TEMPERATURE MONITOR\"; echo \"═══════════════════════════════════\"; osx-cpu-temp; echo \"\"; sysctl -n machdep.xcpm.cpu_thermal_level 2>/dev/null || echo \"Thermal data: N/A\"; sleep 2; done"' &
fi

echo -e "${GREEN}✅ Hollywood Mode PRO activado!${NC}"
echo -e "${YELLOW}💡 Tips:${NC}"
echo "   - Presiona Cmd+Q en cada ventana para cerrar"
echo "   - Presiona 'q' en htop/glances para salir"
echo "   - Ctrl+C en otras ventanas para detener"
echo ""
echo -e "${BLUE}🎭 ¡Disfruta del show!${NC}"
