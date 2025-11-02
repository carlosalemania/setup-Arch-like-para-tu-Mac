#!/bin/bash

echo "🚀 Iniciando Window Manager..."
echo ""

# Iniciar yabai
echo "Iniciando yabai..."
yabai --start-service
sleep 1

# Iniciar skhd
echo "Iniciando skhd..."
skhd --start-service
sleep 1

# Iniciar SketchyBar (opcional)
if command -v sketchybar &>/dev/null; then
    echo "Iniciando SketchyBar..."
    sketchybar 2>/dev/null &
fi

echo ""
echo "✅ Window Manager iniciado!"
echo ""
echo "Verifica el estado con: wm-status"
