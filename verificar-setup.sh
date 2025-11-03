#!/bin/bash

# =============================================================================
# Script de Verificación del Setup Completo
# =============================================================================

echo "🔍 Verificando Setup Arch-like para macOS..."
echo ""

# Colores
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

check_command() {
    if command -v "$1" &> /dev/null; then
        echo -e "${GREEN}✅${NC} $1 instalado: $(which $1)"
        return 0
    else
        echo -e "${RED}❌${NC} $1 NO encontrado"
        return 1
    fi
}

check_file() {
    if [ -f "$1" ]; then
        echo -e "${GREEN}✅${NC} $1 existe"
        return 0
    else
        echo -e "${RED}❌${NC} $1 NO encontrado"
        return 1
    fi
}

check_service() {
    if pgrep -x "$1" > /dev/null; then
        echo -e "${GREEN}✅${NC} $1 corriendo (PID: $(pgrep -x $1))"
        return 0
    else
        echo -e "${YELLOW}⚠️${NC}  $1 NO está corriendo"
        return 1
    fi
}

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "📦 VERIFICANDO WINDOW MANAGER"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
check_command "yabai"
check_command "skhd"
check_command "sketchybar"
echo ""

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "🔧 VERIFICANDO SERVICIOS"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
check_service "yabai"
check_service "skhd"
echo ""

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "🛠️  VERIFICANDO HERRAMIENTAS CLI MODERNAS"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
check_command "eza"
check_command "bat"
check_command "zoxide"
check_command "fzf"
check_command "rg"
check_command "fd"
check_command "delta"
check_command "tldr"
check_command "btop"
check_command "yazi"
check_command "tmux"
echo ""

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "📝 VERIFICANDO ARCHIVOS DE CONFIGURACIÓN"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
check_file "$HOME/.yabairc"
check_file "$HOME/.skhdrc"
check_file "$HOME/.zshrc"
check_file "$HOME/.tmux.conf"
check_file "$HOME/.fzf.zsh"
echo ""

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "🔌 VERIFICANDO PLUGINS"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
# Zsh plugins
if [ -f "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]; then
    echo -e "${GREEN}✅${NC} zsh-autosuggestions instalado"
else
    echo -e "${RED}❌${NC} zsh-autosuggestions NO encontrado"
fi

if [ -f "$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]; then
    echo -e "${GREEN}✅${NC} zsh-syntax-highlighting instalado"
else
    echo -e "${RED}❌${NC} zsh-syntax-highlighting NO encontrado"
fi

if [ -f "$(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme" ]; then
    echo -e "${GREEN}✅${NC} powerlevel10k instalado"
else
    echo -e "${RED}❌${NC} powerlevel10k NO encontrado"
fi

# Tmux plugins
if [ -d "$HOME/.tmux/plugins/tpm" ]; then
    echo -e "${GREEN}✅${NC} TPM (Tmux Plugin Manager) instalado"
else
    echo -e "${RED}❌${NC} TPM NO encontrado"
fi
echo ""

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "📚 VERIFICANDO DOCUMENTACIÓN"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
check_file "$HOME/README.md"
check_file "$HOME/arch-macos-setup-2025.md"
check_file "$HOME/TROUBLESHOOTING-2025.md"
check_file "$HOME/WHATS-NEW-2025.md"
check_file "$HOME/MEJORAS-JOSEAN-DEV.md"
check_file "$HOME/MEJORAS-IMPLEMENTADAS.md"
echo ""

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "🧪 VERIFICANDO ALIASES Y FUNCIONES"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

# Verificar si .zshrc tiene los aliases modernos
if grep -q "alias ls=\"eza" "$HOME/.zshrc"; then
    echo -e "${GREEN}✅${NC} Alias 'ls' → eza configurado"
else
    echo -e "${RED}❌${NC} Alias 'ls' NO configurado"
fi

if grep -q "alias cat=\"bat" "$HOME/.zshrc"; then
    echo -e "${GREEN}✅${NC} Alias 'cat' → bat configurado"
else
    echo -e "${RED}❌${NC} Alias 'cat' NO configurado"
fi

if grep -q "alias cd=\"z" "$HOME/.zshrc"; then
    echo -e "${GREEN}✅${NC} Alias 'cd' → zoxide configurado"
else
    echo -e "${RED}❌${NC} Alias 'cd' NO configurado"
fi

# Verificar funciones
if grep -q "^mkcd()" "$HOME/.zshrc"; then
    echo -e "${GREEN}✅${NC} Función 'mkcd' configurada"
else
    echo -e "${RED}❌${NC} Función 'mkcd' NO encontrada"
fi

if grep -q "^extract()" "$HOME/.zshrc"; then
    echo -e "${GREEN}✅${NC} Función 'extract' configurada"
else
    echo -e "${RED}❌${NC} Función 'extract' NO encontrada"
fi

if grep -q "^killport()" "$HOME/.zshrc"; then
    echo -e "${GREEN}✅${NC} Función 'killport' configurada"
else
    echo -e "${RED}❌${NC} Función 'killport' NO encontrada"
fi
echo ""

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "📊 RESUMEN"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

# Contar éxitos
total=0
passed=0

echo ""
if pgrep -x yabai > /dev/null && pgrep -x skhd > /dev/null; then
    echo -e "${GREEN}✅ Window Manager: FUNCIONANDO${NC}"
    ((passed++))
else
    echo -e "${RED}❌ Window Manager: NO FUNCIONANDO${NC}"
    echo "   Ejecuta: ./start-wm.sh"
fi
((total++))

if command -v eza &> /dev/null && command -v bat &> /dev/null && command -v zoxide &> /dev/null; then
    echo -e "${GREEN}✅ CLI Tools: INSTALADAS${NC}"
    ((passed++))
else
    echo -e "${RED}❌ CLI Tools: INCOMPLETAS${NC}"
fi
((total++))

if [ -f "$HOME/.tmux.conf" ] && [ -d "$HOME/.tmux/plugins/tpm" ]; then
    echo -e "${GREEN}✅ Tmux: CONFIGURADO${NC}"
    ((passed++))
else
    echo -e "${YELLOW}⚠️  Tmux: CONFIGURADO (plugins pendientes)${NC}"
    echo "   Ejecuta: tmux y presiona Ctrl+Space luego I"
fi
((total++))

if grep -q "alias ls=\"eza" "$HOME/.zshrc"; then
    echo -e "${GREEN}✅ Aliases modernos: CONFIGURADOS${NC}"
    ((passed++))
else
    echo -e "${RED}❌ Aliases modernos: NO CONFIGURADOS${NC}"
fi
((total++))

if [ -f "$HOME/README.md" ]; then
    echo -e "${GREEN}✅ Documentación: COMPLETA${NC}"
    ((passed++))
else
    echo -e "${RED}❌ Documentación: INCOMPLETA${NC}"
fi
((total++))

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
percentage=$((passed * 100 / total))
if [ $percentage -eq 100 ]; then
    echo -e "${GREEN}🎉 Setup completado al 100%!${NC}"
elif [ $percentage -ge 80 ]; then
    echo -e "${GREEN}✅ Setup casi completo: $percentage%${NC}"
else
    echo -e "${YELLOW}⚠️  Setup al $percentage% - Revisa los errores arriba${NC}"
fi
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

echo "💡 PRÓXIMOS PASOS:"
echo ""
echo "1. Si los servicios no están corriendo:"
echo "   ./start-wm.sh"
echo ""
echo "2. Abre nueva terminal para aplicar aliases:"
echo "   Cmd+T (nueva pestaña) o Cmd+N (nueva ventana)"
echo ""
echo "3. Prueba los comandos modernos:"
echo "   ls        # debería mostrar eza con íconos"
echo "   cat ~/.zshrc  # debería mostrar bat con colores"
echo "   z Desktop    # debería usar zoxide"
echo ""
echo "4. Inicia tmux e instala plugins:"
echo "   tmux"
echo "   # Presiona: Ctrl+Space luego I"
echo ""
echo "5. Prueba los atajos nuevos de yabai/skhd"
echo "   Ver: cat ~/.skhdrc | bat"
echo ""
echo "✅ Verificación completada!"
