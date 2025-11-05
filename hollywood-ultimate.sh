#!/bin/bash
# hollywood-ultimate.sh - La experiencia Hollywood DEFINITIVA para macOS
# Usa TODAS las herramientas instaladas

set -e

GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

clear

echo -e "${BLUE}"
cat << "EOF"
╔════════════════════════════════════════════════════════════════╗
║                                                                ║
║        🎬 HOLLYWOOD ULTIMATE MODE 🎬                           ║
║                                                                ║
║     "Hackerman Mode: Activado"                                ║
║                                                                ║
╚════════════════════════════════════════════════════════════════╝
EOF
echo -e "${NC}"

sleep 1

# Contador de ventanas
WINDOW_COUNT=0

# Función para abrir ventana con contador
open_window() {
    local cmd=$1
    local title=$2
    ((WINDOW_COUNT++))

    echo -e "${GREEN}[$WINDOW_COUNT] 🚀 Lanzando: ${CYAN}$title${NC}"
    osascript -e "tell application \"Terminal\" to do script \"printf '\\\\033]0;$title\\\\007'; $cmd\"" &
    sleep 0.4
}

echo -e "${YELLOW}Selecciona el nivel de Hollywood:${NC}"
echo "  1) 🎬 Básico    (6 ventanas  - Ligero)"
echo "  2) 🎭 Avanzado  (12 ventanas - Moderado)"
echo "  3) 🚀 Ultimate  (20+ ventanas - MÁXIMO IMPACTO)"
echo "  4) 🎯 Custom    (Tú eliges)"
echo ""
read -p "Opción [1-4]: " -n 1 -r LEVEL
echo ""
echo ""

case $LEVEL in
    1)
        echo -e "${BLUE}🎬 Modo BÁSICO${NC}"
        echo ""

        open_window "cmatrix -b -C green" "🟢 Matrix Effect"
        open_window "htop" "📊 Process Monitor"
        open_window "bmon" "🌐 Network Bandwidth"
        open_window "while true; do clear; echo '═══════════════════'; echo '  💾 DISK MONITOR'; echo '═══════════════════'; duf; sleep 3; done" "💾 Disk Monitor"
        open_window "gping google.com 1.1.1.1 8.8.8.8" "📡 Network Ping"
        open_window "log stream --predicate 'eventMessage contains[cd] \"\"' --style syslog --color always | grep --color=always -E 'error|warn|fail|success|INFO|ERROR|WARN|\$'" "📝 System Logs"
        ;;

    2)
        echo -e "${MAGENTA}🎭 Modo AVANZADO${NC}"
        echo ""

        # Grupo 1: Efectos visuales
        open_window "cmatrix -b -C green" "🟢 Matrix Green"
        open_window "cmatrix -b -C cyan" "🔵 Matrix Cyan"

        # Grupo 2: Monitoreo de sistema
        open_window "btop" "📊 System Monitor (btop)"
        open_window "glances" "📈 System Overview (glances)"

        # Grupo 3: Red
        open_window "bmon" "🌐 Bandwidth Monitor"
        open_window "sudo bandwhich" "🔌 Network by Process"
        open_window "gping google.com 1.1.1.1 cloudflare.com" "📡 Multi-Ping"

        # Grupo 4: Disco y archivos
        open_window "while true; do clear; echo '═══════════════════'; echo '  💾 DISK USAGE'; echo '═══════════════════'; duf; echo ''; dust -d 1 ~; sleep 4; done" "💾 Disk Analysis"

        # Grupo 5: Logs y debugging
        open_window "lnav" "📜 Log Navigator"
        open_window "log stream --predicate 'eventMessage contains[cd] \"\"' --style syslog --color always | grep --color=always -E 'error|warn|fail|success|INFO|ERROR|WARN|\$'" "📝 System Logs"

        # Grupo 6: Info del sistema
        open_window "while true; do clear; echo '═══════════════════'; echo '  🌡️  TEMPERATURE'; echo '═══════════════════'; osx-cpu-temp 2>/dev/null || echo 'osx-cpu-temp not installed'; sysctl -a | grep temperature 2>/dev/null | head -n 5; sleep 2; done" "🌡️ Temperature"

        # Grupo 7: Extras
        open_window "while true; do fortune | cowsay | lolcat; sleep 5; done" "🐮 Fortune Cow"
        ;;

    3)
        echo -e "${RED}🚀 Modo ULTIMATE - ¡MÁXIMA POTENCIA!${NC}"
        echo -e "${YELLOW}⚠️  Esto abrirá 20+ ventanas${NC}"
        echo ""
        sleep 1

        # EFECTOS VISUALES (4 ventanas)
        echo -e "${CYAN}[VISUAL EFFECTS]${NC}"
        open_window "cmatrix -b -C green" "🟢 Matrix Green"
        open_window "cmatrix -b -C cyan" "🔵 Matrix Cyan"
        open_window "pipes.sh -t 2" "🎨 Pipes Animation"
        open_window "while true; do fortune | cowsay -f $(ls /opt/homebrew/share/cows/*.cow | shuf -n1) | lolcat; sleep 4; done" "🦄 Random Cowsay"

        # MONITOREO DE SISTEMA (4 ventanas)
        echo -e "${CYAN}[SYSTEM MONITORING]${NC}"
        open_window "btop" "📊 BTOP"
        open_window "htop" "📊 HTOP"
        open_window "glances" "📈 Glances"
        open_window "while true; do clear; procs --sortd cpu --watch 2; done" "⚙️ Procs (Top Processes)"

        # MONITOREO DE RED (5 ventanas)
        echo -e "${CYAN}[NETWORK MONITORING]${NC}"
        open_window "bmon" "🌐 Bandwidth (bmon)"
        open_window "sudo iftop -i en0" "🔌 Network Traffic (iftop)"
        open_window "sudo nethogs" "📶 Network by Process (nethogs)"
        open_window "sudo bandwhich" "🔗 Bandwhich"
        open_window "gping google.com 1.1.1.1 cloudflare.com github.com" "📡 Multi-Ping Graph"

        # DISCO Y ALMACENAMIENTO (3 ventanas)
        echo -e "${CYAN}[STORAGE]${NC}"
        open_window "while true; do clear; duf; sleep 3; done" "💾 Disk Usage (duf)"
        open_window "while true; do clear; dust -d 2 ~; sleep 5; done" "📦 Dust Analysis"
        open_window "ncdu ~" "🔍 NCurses Disk Usage"

        # LOGS Y DEBUGGING (3 ventanas)
        echo -e "${CYAN}[LOGS & DEBUG]${NC}"
        open_window "lnav" "📜 Log Navigator"
        open_window "log stream --level debug --style compact --color always | grep --color=always -E 'error|warn|fail|Error|Warning|\$'" "📝 System Logs (Debug)"
        open_window "log stream --predicate 'eventType == activityCreateEvent || eventType == logEvent' --style json | jq -C" "🔧 JSON Logs"

        # DOCKER (si está instalado)
        if command -v docker &> /dev/null; then
            echo -e "${CYAN}[DOCKER]${NC}"
            open_window "lazydocker" "🐳 LazyDocker"
            open_window "ctop" "📊 Container Top"
        fi

        # GIT (si estás en un repo)
        if git rev-parse --git-dir > /dev/null 2>&1; then
            echo -e "${CYAN}[GIT]${NC}"
            open_window "lazygit" "🌿 LazyGit"
            open_window "tig" "🌳 Tig Browser"
        fi

        # TEMPERATURA Y HARDWARE (2 ventanas)
        echo -e "${CYAN}[HARDWARE]${NC}"
        open_window "while true; do clear; echo '═══════════════════'; echo '  🌡️  TEMPERATURE & CPU'; echo '═══════════════════'; osx-cpu-temp 2>/dev/null || echo 'Install: brew install osx-cpu-temp'; echo ''; sysctl -a | grep -E 'machdep.cpu|hw.cpu' | head -n 10; sleep 2; done" "🌡️ Temperature"
        open_window "while true; do clear; echo '═══════════════════'; echo '  🧠 MEMORY PRESSURE'; echo '═══════════════════'; memory_pressure; vm_stat; sleep 3; done" "🧠 Memory Pressure"

        # NETWORK TESTS (2 ventanas)
        echo -e "${CYAN}[NETWORK TESTS]${NC}"
        open_window "while true; do speedtest-cli; sleep 300; done" "🚀 Speed Test"
        open_window "while true; do clear; echo '═══════════════════'; echo '  🌐 NETWORK INFO'; echo '═══════════════════'; ifconfig | grep -E 'inet |ether ' | head -n 10; echo ''; netstat -an | grep ESTABLISHED | wc -l | xargs echo 'Established Connections:'; sleep 5; done" "🌐 Network Info"

        # EXTRAS DIVERTIDOS (2 ventanas)
        echo -e "${CYAN}[FUN STUFF]${NC}"
        open_window "asciiquarium" "🐠 Asciiquarium"
        open_window "while true; do echo \"\$(date): \$(fortune)\" | figlet -f small | lolcat; sleep 8; done" "🎨 Fortune Figlet"
        ;;

    4)
        echo -e "${YELLOW}🎯 Modo CUSTOM${NC}"
        echo ""
        echo "Selecciona las herramientas que quieres ver:"
        echo ""

        read -p "Matrix Effect? (s/n) " -n 1 -r; echo
        [[ $REPLY =~ ^[Ss]$ ]] && open_window "cmatrix -b -C green" "🟢 Matrix"

        read -p "BTOP? (s/n) " -n 1 -r; echo
        [[ $REPLY =~ ^[Ss]$ ]] && open_window "btop" "📊 BTOP"

        read -p "Glances? (s/n) " -n 1 -r; echo
        [[ $REPLY =~ ^[Ss]$ ]] && open_window "glances" "📈 Glances"

        read -p "Network Monitor (bmon)? (s/n) " -n 1 -r; echo
        [[ $REPLY =~ ^[Ss]$ ]] && open_window "bmon" "🌐 Network"

        read -p "Ping Graph (gping)? (s/n) " -n 1 -r; echo
        [[ $REPLY =~ ^[Ss]$ ]] && open_window "gping google.com 1.1.1.1" "📡 Ping"

        read -p "Disk Usage (duf)? (s/n) " -n 1 -r; echo
        [[ $REPLY =~ ^[Ss]$ ]] && open_window "while true; do clear; duf; sleep 3; done" "💾 Disk"

        read -p "System Logs? (s/n) " -n 1 -r; echo
        [[ $REPLY =~ ^[Ss]$ ]] && open_window "log stream --style syslog --color always" "📝 Logs"

        read -p "LazyDocker? (s/n) " -n 1 -r; echo
        [[ $REPLY =~ ^[Ss]$ ]] && open_window "lazydocker" "🐳 Docker"

        read -p "Fortune Cow (diversión)? (s/n) " -n 1 -r; echo
        [[ $REPLY =~ ^[Ss]$ ]] && open_window "while true; do fortune | cowsay | lolcat; sleep 5; done" "🐮 Fun"
        ;;

    *)
        echo -e "${RED}❌ Opción inválida${NC}"
        exit 1
        ;;
esac

echo ""
echo -e "${GREEN}"
cat << "EOF"
╔════════════════════════════════════════════════════════════════╗
║                                                                ║
║            ✅ HOLLYWOOD MODE ACTIVADO ✅                       ║
║                                                                ║
╚════════════════════════════════════════════════════════════════╝
EOF
echo -e "${NC}"

echo -e "${BLUE}📊 Estadísticas:${NC}"
echo -e "   • Ventanas abiertas: ${GREEN}$WINDOW_COUNT${NC}"
echo -e "   • Nivel: ${MAGENTA}$([[ $LEVEL == 1 ]] && echo 'Básico' || [[ $LEVEL == 2 ]] && echo 'Avanzado' || [[ $LEVEL == 3 ]] && echo 'Ultimate' || echo 'Custom')${NC}"
echo ""
echo -e "${YELLOW}💡 Tips:${NC}"
echo "   • Cmd+Q o Cmd+W para cerrar ventanas"
echo "   • Cmd+Ctrl+F para fullscreen"
echo "   • Usa Spaces (Ctrl+→/←) para navegar"
echo "   • ./hollywood-stop.sh para detener todos los procesos"
echo ""
echo -e "${CYAN}🎬 ¡Disfruta del show! 🎭${NC}"

# Opcional: organizar con yabai si está disponible
if command -v yabai &> /dev/null; then
    echo ""
    read -p "¿Organizar ventanas con yabai? (s/n) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Ss]$ ]]; then
        sleep 2
        yabai -m space --layout bsp
        echo -e "${GREEN}✓ Ventanas organizadas${NC}"
    fi
fi
