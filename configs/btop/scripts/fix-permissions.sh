#!/bin/bash
# Script para arreglar permisos y instalar temas

echo "🔧 Arreglando permisos..."
sudo chown -R $USER:staff ~/.config

echo ""
echo "📁 Creando directorios..."
mkdir -p ~/.config/btop/themes

echo ""
echo "🎨 Copiando temas..."
cp ~/btop-themes-custom/*.theme ~/.config/btop/themes/

echo ""
echo "⚙️  Copiando configuración..."
cp ~/btop-themes-custom/btop.conf ~/.config/btop/

echo ""
echo "🎨 Configurando Dracula Premium como tema predeterminado..."
sed -i.bak 's/^color_theme = .*/color_theme = "dracula-premium"/' ~/.config/btop/btop.conf

echo ""
echo "✅ Agregando alias..."
if ! grep -q "btop-theme" ~/.zshrc 2>/dev/null; then
    echo 'alias btop-theme="~/btop-themes-custom/btop-theme-switcher.sh"' >> ~/.zshrc
fi

echo ""
echo "✅ ¡TODO INSTALADO!"
echo ""
echo "🎨 Tema activo: Dracula Premium"
echo ""
echo "Ejecuta: source ~/.zshrc"
echo "Luego abre: btop"
echo ""
echo "Para cambiar de tema: btop-theme"
