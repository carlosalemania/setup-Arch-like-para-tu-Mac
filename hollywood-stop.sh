#!/bin/bash
# hollywood-stop.sh - Detener Hollywood Mode

echo "🛑 Deteniendo Hollywood Mode..."

# Matar procesos específicos de Hollywood
pkill -f cmatrix
pkill -f htop
pkill -f nettop
pkill -f glances

echo "✅ Hollywood Mode detenido"
echo "💡 Las ventanas de Terminal permanecen abiertas. Ciérralas manualmente con Cmd+W"
