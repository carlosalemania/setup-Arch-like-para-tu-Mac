#!/bin/bash
# hollywood-install-tools.sh - Instalar todas las herramientas Hollywood para macOS

set -e

GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${BLUE}"
cat << "EOF"
╔═══════════════════════════════════════════════════════╗
║                                                       ║
║       🎬 HOLLYWOOD TOOLS INSTALLER FOR macOS 🎬       ║
║                                                       ║
║     Arsenal completo de herramientas de monitoreo    ║
║                                                       ║
╚═══════════════════════════════════════════════════════╝
EOF
echo -e "${NC}"

# Verificar si Homebrew está instalado
if ! command -v brew &> /dev/null; then
    echo -e "${RED}❌ Homebrew no está instalado${NC}"
    echo -e "${YELLOW}📦 Instalando Homebrew...${NC}"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # Configurar PATH para Apple Silicon
    if [[ $(uname -m) == "arm64" ]]; then
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
else
    echo -e "${GREEN}✓ Homebrew ya está instalado${NC}"
fi

echo ""
echo -e "${BLUE}═══════════════════════════════════════════════════════${NC}"
echo -e "${BLUE}  INSTALANDO HERRAMIENTAS BÁSICAS${NC}"
echo -e "${BLUE}═══════════════════════════════════════════════════════${NC}"
echo ""

# Función para instalar con feedback
install_tool() {
    local tool=$1
    local description=$2

    echo -e "${YELLOW}📦 Instalando $tool${NC} - $description"

    if brew install "$tool" 2>/dev/null; then
        echo -e "${GREEN}   ✓ $tool instalado correctamente${NC}"
    else
        echo -e "${RED}   ⚠️  Error instalando $tool (puede que ya esté instalado)${NC}"
    fi
    echo ""
}

# Herramientas BÁSICAS (equivalentes a tu lista)
echo -e "${BLUE}🎯 Grupo 1: Visualización y Efectos${NC}"
install_tool "cmatrix" "Efecto Matrix en terminal"
install_tool "figlet" "Arte ASCII de texto grande"
install_tool "lolcat" "Colorea la salida con arcoíris"

echo -e "${BLUE}🎯 Grupo 2: Monitoreo de Sistema${NC}"
install_tool "htop" "Monitor interactivo de procesos (mejor que top)"
install_tool "btop" "Monitor de recursos estilo gráfico"
install_tool "glances" "Monitor todo-en-uno (mejor que htop)"

echo -e "${BLUE}🎯 Grupo 3: Monitoreo de Red${NC}"
install_tool "nmap" "Escáner de red y puertos"
install_tool "bmon" "Monitor de ancho de banda"
install_tool "iftop" "Monitor de tráfico de red en tiempo real"
install_tool "nethogs" "Monitor de uso de red por proceso"
install_tool "speedtest-cli" "Test de velocidad de internet CLI"

echo -e "${BLUE}🎯 Grupo 4: Utilidades JSON y Datos${NC}"
install_tool "jq" "Procesador JSON en línea de comandos"
install_tool "fx" "Visor JSON interactivo"

echo ""
echo -e "${BLUE}═══════════════════════════════════════════════════════${NC}"
echo -e "${BLUE}  INSTALANDO HERRAMIENTAS AVANZADAS${NC}"
echo -e "${BLUE}═══════════════════════════════════════════════════════${NC}"
echo ""

echo -e "${BLUE}🎯 Grupo 5: Herramientas macOS Específicas${NC}"
install_tool "osx-cpu-temp" "Monitor de temperatura del CPU"
install_tool "m-cli" "Utilidades macOS desde terminal"

echo -e "${BLUE}🎯 Grupo 6: Herramientas de Sistema Avanzadas${NC}"
install_tool "ncdu" "Analizador de disco con interfaz NCurses"
install_tool "duf" "Visualizador de uso de disco (mejor que df)"
install_tool "gping" "Ping con gráfico en tiempo real"
install_tool "bandwhich" "Monitor de uso de red por proceso/conexión"

echo -e "${BLUE}🎯 Grupo 7: Logs y Debugging${NC}"
install_tool "lnav" "Visor de logs avanzado"
install_tool "bat" "cat con syntax highlighting"

echo -e "${BLUE}🎯 Grupo 8: Docker y Containers${NC}"
install_tool "ctop" "Monitor tipo top para containers"
install_tool "lazydocker" "Terminal UI para Docker"

echo -e "${BLUE}🎯 Grupo 9: Git y Desarrollo${NC}"
install_tool "tig" "Interfaz texto para Git"
install_tool "lazygit" "Terminal UI simple para Git"

echo -e "${BLUE}🎯 Grupo 10: Extras Divertidos${NC}"
install_tool "cowsay" "Vaca que habla en ASCII"
install_tool "fortune" "Frases aleatorias"
install_tool "sl" "Tren en tu terminal (typo de 'ls')"
install_tool "asciiquarium" "Acuario en ASCII animado"
install_tool "pipes-sh" "Pipes animadas screensaver"

echo ""
echo -e "${BLUE}═══════════════════════════════════════════════════════${NC}"
echo -e "${BLUE}  HERRAMIENTAS OPCIONALES (Rust/Python)${NC}"
echo -e "${BLUE}═══════════════════════════════════════════════════════${NC}"
echo ""

echo -e "${YELLOW}¿Deseas instalar herramientas adicionales escritas en Rust? (s/n)${NC}"
read -p "> " -n 1 -r
echo
if [[ $REPLY =~ ^[Ss]$ ]]; then
    echo -e "${BLUE}🦀 Instalando herramientas Rust...${NC}"
    install_tool "bottom" "Monitor de sistema en Rust (alias: btm)"
    install_tool "procs" "Reemplazo moderno de 'ps'"
    install_tool "dust" "du + rust = dust (uso de disco)"
    install_tool "tokei" "Contador de líneas de código"
    install_tool "hyperfine" "Benchmarking de comandos"
fi

echo ""
echo -e "${YELLOW}¿Deseas instalar herramientas Python adicionales? (s/n)${NC}"
read -p "> " -n 1 -r
echo
if [[ $REPLY =~ ^[Ss]$ ]]; then
    echo -e "${BLUE}🐍 Instalando herramientas Python...${NC}"

    # Verificar si pip está disponible
    if command -v pip3 &> /dev/null; then
        pip3 install --user speedtest-cli
        pip3 install --user httpie
        pip3 install --user ipython
        echo -e "${GREEN}✓ Herramientas Python instaladas${NC}"
    else
        echo -e "${RED}⚠️  pip3 no encontrado, saltando instalación Python${NC}"
    fi
fi

echo ""
echo -e "${GREEN}"
cat << "EOF"
╔═══════════════════════════════════════════════════════╗
║                                                       ║
║            ✅ INSTALACIÓN COMPLETADA ✅               ║
║                                                       ║
╚═══════════════════════════════════════════════════════╝
EOF
echo -e "${NC}"

echo -e "${BLUE}📊 RESUMEN DE HERRAMIENTAS INSTALADAS:${NC}"
echo ""
echo -e "${GREEN}Visualización:${NC}"
echo "  • cmatrix, figlet, lolcat, cowsay, fortune"
echo ""
echo -e "${GREEN}Monitoreo de Sistema:${NC}"
echo "  • htop, btop, glances, bottom"
echo ""
echo -e "${GREEN}Monitoreo de Red:${NC}"
echo "  • nmap, bmon, iftop, nethogs, bandwhich, gping"
echo ""
echo -e "${GREEN}Utilidades:${NC}"
echo "  • jq, fx, bat, ncdu, duf"
echo ""
echo -e "${GREEN}Docker/Git:${NC}"
echo "  • ctop, lazydocker, tig, lazygit"
echo ""

echo -e "${YELLOW}💡 PRUEBA ESTOS COMANDOS:${NC}"
echo ""
echo "  cmatrix              # Efecto Matrix"
echo "  htop                 # Monitor de procesos"
echo "  btop                 # Monitor visual de sistema"
echo "  glances              # Monitor completo"
echo "  bmon                 # Monitor de red"
echo "  gping google.com     # Ping visual"
echo "  ncdu                 # Analizador de disco"
echo "  bandwhich            # Uso de red por proceso"
echo "  lazydocker           # UI para Docker"
echo "  lazygit              # UI para Git"
echo ""
echo -e "${BLUE}🎬 Para lanzar Hollywood Mode:${NC}"
echo "  ./hollywood-pro.sh"
echo ""
echo -e "${GREEN}¡Todo listo para tu experiencia Hollywood! 🎭${NC}"
