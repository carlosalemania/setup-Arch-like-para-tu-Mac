#!/bin/bash
# hollywood-mac.sh - Efecto Hollywood para macOS
# Abre múltiples ventanas de Terminal con diferentes monitores del sistema

echo "🎬 Iniciando Hollywood Mode..."

# Verificar si cmatrix está instalado
if ! command -v cmatrix &> /dev/null; then
    echo "⚠️  cmatrix no está instalado. Instalando..."
    brew install cmatrix
fi

# Verificar si htop está instalado
if ! command -v htop &> /dev/null; then
    echo "⚠️  htop no está instalado. Instalando..."
    brew install htop
fi

# Abrir nueva ventana de Terminal con cmatrix (Efecto Matrix)
osascript -e 'tell application "Terminal" to do script "cmatrix -b -C green"'
sleep 0.5

# Otra con htop (Monitor de procesos)
osascript -e 'tell application "Terminal" to do script "htop"'
sleep 0.5

# Otra con logs del sistema
osascript -e 'tell application "Terminal" to do script "log stream --predicate \"eventMessage contains[cd] \\\"\\\"\" --style syslog --color always"'
sleep 0.5

# Otra con actividad de red
osascript -e 'tell application "Terminal" to do script "nettop -m tcp"'
sleep 0.5

# Monitor de temperatura y CPU (si tienes osx-cpu-temp instalado)
if command -v osx-cpu-temp &> /dev/null; then
    osascript -e 'tell application "Terminal" to do script "while true; do clear; osx-cpu-temp; sleep 1; done"'
    sleep 0.5
fi

# Monitor de disco en tiempo real
osascript -e 'tell application "Terminal" to do script "while true; do clear; df -h; iostat -w 1; done"'
sleep 0.5

echo "✅ Hollywood Mode activado!"
echo "💡 Presiona Cmd+Q en cada ventana para cerrarlas"
