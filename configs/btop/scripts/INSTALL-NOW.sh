#!/bin/bash
# Instalación Rápida - Ejecuta esto después de arreglar permisos

echo "🚀 Instalación Rápida de Temas BTOP"
echo ""
echo "Paso 1: Arreglar permisos (necesita tu password)"
sudo chown -R $USER:staff ~/.config

echo ""
echo "Paso 2: Crear directorios"
mkdir -p ~/.config/btop/themes

echo ""
echo "Paso 3: Copiar temas"
cp ~/btop-themes-custom/*.theme ~/.config/btop/themes/

echo ""
echo "Paso 4: Copiar configuración"
if [ ! -f ~/.config/btop/btop.conf ]; then
    cp ~/btop-themes-custom/btop.conf ~/.config/btop/
    echo "✅ Configuración instalada"
else
    echo "ℹ️  Configuración existente mantenida"
fi

echo ""
echo "Paso 5: Agregar alias"
if ! grep -q "btop-theme" ~/.zshrc 2>/dev/null; then
    echo "alias btop-theme='~/btop-themes-custom/btop-theme-switcher.sh'" >> ~/.zshrc
    echo "✅ Alias agregado a .zshrc"
fi

echo ""
echo "✅ ¡INSTALACIÓN COMPLETA!"
echo ""
echo "Ejecuta: source ~/.zshrc"
echo "Luego: btop-theme"
echo ""
echo "🎨 Temas instalados:"
ls ~/.config/btop/themes/

