#!/bin/bash

# =============================================================================
# Script para Solucionar Problema de Conexión a GitHub
# =============================================================================

set -e

# Colores
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE}╔════════════════════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║   🔧 Solucionador de Problemas GitHub/Homebrew       ║${NC}"
echo -e "${BLUE}╚════════════════════════════════════════════════════════╝${NC}"
echo ""

# 1. Verificar conectividad básica
echo -e "${BLUE}[1/6]${NC} Verificando conectividad básica..."
if ping -c 3 github.com &>/dev/null; then
    echo -e "${GREEN}✅ Ping a GitHub: OK${NC}"
else
    echo -e "${RED}❌ Ping a GitHub: FALLÓ${NC}"
    echo -e "${YELLOW}⚠️  Verifica tu conexión a internet${NC}"
    exit 1
fi

# 2. Limpiar DNS cache
echo -e "${BLUE}[2/6]${NC} Limpiando DNS cache..."
sudo dscacheutil -flushcache 2>/dev/null
sudo killall -HUP mDNSResponder 2>/dev/null
echo -e "${GREEN}✅ DNS cache limpiado${NC}"

# 3. Verificar y limpiar configuración de Git
echo -e "${BLUE}[3/6]${NC} Verificando configuración de Git..."

if git config --global --get http.proxy &>/dev/null; then
    echo -e "${YELLOW}⚠️  Proxy HTTP encontrado en Git config${NC}"
    read -p "¿Deseas eliminarlo? (y/n) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        git config --global --unset http.proxy
        git config --global --unset https.proxy 2>/dev/null || true
        echo -e "${GREEN}✅ Proxies eliminados${NC}"
    fi
else
    echo -e "${GREEN}✅ No hay proxies configurados${NC}"
fi

# Configurar timeouts más largos
git config --global http.postBuffer 524288000
git config --global http.lowSpeedLimit 0
git config --global http.lowSpeedTime 999999
echo -e "${GREEN}✅ Timeouts de Git configurados${NC}"

# 4. Verificar HTTPS a GitHub
echo -e "${BLUE}[4/6]${NC} Verificando acceso HTTPS..."
if curl -Is https://github.com --max-time 10 | head -1 | grep -q 200; then
    echo -e "${GREEN}✅ HTTPS a GitHub: OK${NC}"
else
    echo -e "${RED}❌ HTTPS a GitHub: FALLÓ${NC}"
    exit 1
fi

# 5. Limpiar taps de Homebrew corruptos
echo -e "${BLUE}[5/6]${NC} Limpiando taps de Homebrew..."
brew untap koekeishiya/formulae 2>/dev/null || true
brew untap FelixKratz/formulae 2>/dev/null || true
echo -e "${GREEN}✅ Taps limpiados${NC}"

# 6. Intentar re-tap con reintentos
echo -e "${BLUE}[6/6]${NC} Intentando agregar taps de nuevo..."

add_tap_with_retry() {
    local tap=$1
    local retries=3
    local count=0

    while [ $count -lt $retries ]; do
        if brew tap $tap 2>/dev/null; then
            echo -e "${GREEN}✅ Tap $tap agregado exitosamente${NC}"
            return 0
        fi
        count=$((count + 1))
        echo -e "${YELLOW}⚠️  Intento $count de $retries falló, esperando 5 segundos...${NC}"
        sleep 5
    done

    echo -e "${RED}❌ No se pudo agregar tap $tap después de $retries intentos${NC}"
    return 1
}

echo ""
echo "Agregando tap koekeishiya/formulae..."
add_tap_with_retry koekeishiya/formulae

echo ""
echo "Agregando tap FelixKratz/formulae..."
add_tap_with_retry FelixKratz/formulae

echo ""
echo -e "${BLUE}╔════════════════════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║                  ✅ PROCESO COMPLETADO                ║${NC}"
echo -e "${BLUE}╚════════════════════════════════════════════════════════╝${NC}"
echo ""
echo -e "${GREEN}Ahora puedes intentar de nuevo:${NC}"
echo ""
echo "  ${BLUE}1.${NC} Instalar yabai:"
echo "     $ brew install koekeishiya/formulae/yabai"
echo ""
echo "  ${BLUE}2.${NC} Instalar skhd:"
echo "     $ brew install koekeishiya/formulae/skhd"
echo ""
echo "  ${BLUE}3.${NC} O ejecutar el script completo:"
echo "     $ ./install-arch-macos-fixed.sh"
echo ""
