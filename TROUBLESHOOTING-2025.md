# 🔧 Guía de Solución de Problemas - Setup Arch-like macOS 2025

**Última actualización**: Noviembre 2025

## 📋 Tabla de Contenidos

1. [Problemas de Instalación](#problemas-de-instalación)
2. [Problemas de GitHub/Homebrew](#problemas-de-githubbrew)
3. [Yabai & Skhd](#yabai--skhd)
4. [SketchyBar](#sketchybar)
5. [Permisos y Seguridad](#permisos-y-seguridad)
6. [Soluciones Rápidas](#soluciones-rápidas)

---

## 🚨 Problemas de Instalación

### Error: "Failed to connect to github.com port 443"

**Síntomas**:
```
fatal: unable to access 'https://github.com/...': Failed to connect to github.com port 443
```

**Causas Comunes**:
1. Problema temporal de red
2. DNS cache corrupto
3. Firewall/VPN bloqueando conexiones
4. Git configurado con proxy incorrecto

**Soluciones**:

#### Solución 1: Reintentar la instalación
```bash
# A veces es solo temporal, espera 30 segundos y reintenta
sleep 30
brew tap koekeishiya/formulae
```

#### Solución 2: Limpiar DNS cache
```bash
sudo dscacheutil -flushcache
sudo killall -HUP mDNSResponder
echo "DNS cache limpiado. Reintenta la instalación."
```

#### Solución 3: Verificar y limpiar configuración de Git
```bash
# Ver configuración actual
git config --global --list | grep -i proxy

# Si hay proxies configurados que no deberías tener:
git config --global --unset http.proxy
git config --global --unset https.proxy

# Verificar conectividad
curl -I https://github.com
```

#### Solución 4: Usar SSH en lugar de HTTPS
```bash
# Configurar Git para usar SSH
git config --global url."git@github.com:".insteadOf "https://github.com/"

# Asegurarse de tener una clave SSH
if [ ! -f ~/.ssh/id_ed25519 ]; then
    ssh-keygen -t ed25519 -C "tu-email@ejemplo.com"
fi

# Agregar la clave a ssh-agent
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

# Probar conexión SSH
ssh -T git@github.com
```

#### Solución 5: Instalar directamente desde releases
```bash
# Si Homebrew tap falla, instalar desde releases oficiales
cd /tmp
# Yabai
curl -L https://github.com/koekeishiya/yabai/releases/latest/download/yabai.tar.gz -o yabai.tar.gz
tar -xzf yabai.tar.gz
sudo mv yabai /usr/local/bin/
sudo chmod +x /usr/local/bin/yabai

# Skhd
curl -L https://github.com/koekeishiya/skhd/releases/latest/download/skhd.tar.gz -o skhd.tar.gz
tar -xzf skhd.tar.gz
sudo mv skhd /usr/local/bin/
sudo chmod +x /usr/local/bin/skhd
```

---

## 🐙 Problemas de GitHub/Homebrew

### Homebrew tap muy lento o falla

```bash
# Actualizar Homebrew
brew update

# Diagnosticar problemas
brew doctor

# Limpiar taps corruptos
brew untap koekeishiya/formulae 2>/dev/null
rm -rf $(brew --repository)/Library/Taps/koekeishiya/homebrew-formulae

# Re-tap con timeout más largo
export HOMEBREW_CURL_RETRIES=3
brew tap koekeishiya/formulae
```

### Verificar conectividad completa

```bash
# Crear script de diagnóstico
cat > ~/test-connectivity.sh << 'EOF'
#!/bin/bash

echo "🔍 Diagnóstico de Conectividad GitHub"
echo "======================================"

# 1. Ping
echo -e "\n1. Test PING:"
if ping -c 3 github.com &>/dev/null; then
    echo "✅ Ping a github.com: OK"
else
    echo "❌ Ping a github.com: FALLÓ"
fi

# 2. HTTPS
echo -e "\n2. Test HTTPS:"
if curl -Is https://github.com --max-time 10 | head -1 | grep -q 200; then
    echo "✅ HTTPS a github.com: OK"
else
    echo "❌ HTTPS a github.com: FALLÓ"
fi

# 3. Git clone
echo -e "\n3. Test Git Clone:"
cd /tmp
rm -rf test-repo 2>/dev/null
if timeout 10 git clone https://github.com/koekeishiya/homebrew-formulae test-repo &>/dev/null; then
    echo "✅ Git clone: OK"
    rm -rf test-repo
else
    echo "❌ Git clone: FALLÓ"
fi

# 4. DNS Resolution
echo -e "\n4. Test DNS:"
if nslookup github.com &>/dev/null; then
    echo "✅ DNS Resolution: OK"
    echo "   Direcciones IP:"
    nslookup github.com | grep "Address:" | tail -n +2
else
    echo "❌ DNS Resolution: FALLÓ"
fi

# 5. Proxy Settings
echo -e "\n5. Configuración Proxy:"
proxy_settings=$(scutil --proxy | grep -E "HTTPProxy|HTTPSProxy")
if [ -z "$proxy_settings" ]; then
    echo "✅ No hay proxies configurados"
else
    echo "⚠️  Proxies detectados:"
    echo "$proxy_settings"
fi

echo -e "\n======================================"
echo "Diagnóstico completado"
EOF

chmod +x ~/test-connectivity.sh
~/test-connectivity.sh
```

---

## 🪟 Yabai & Skhd

### Cambios Importantes en 2025

**⚠️ IMPORTANTE**: Los comandos de servicio han cambiado:

```bash
# ❌ VIEJO (ya no funciona)
brew services start yabai
brew services start skhd

# ✅ NUEVO (2025)
yabai --start-service
skhd --start-service
```

### Instalación Correcta (2025)

```bash
# 1. Instalar
brew install koekeishiya/formulae/yabai
brew install koekeishiya/formulae/skhd

# 2. Crear LaunchAgents directory si no existe
mkdir -p ~/Library/LaunchAgents

# 3. Instalar servicios
yabai --install-service
skhd --install-service

# 4. Iniciar servicios (esto pedirá permisos)
yabai --start-service
skhd --start-service

# 5. Verificar estado
yabai --check-service
skhd --check-service
```

### Yabai no funciona después de actualización

```bash
# 1. Detener servicios
yabai --stop-service
skhd --stop-service

# 2. Desinstalar servicios viejos
yabai --uninstall-service
skhd --uninstall-service

# 3. Actualizar
brew upgrade yabai skhd

# 4. Reinstalar servicios
yabai --install-service
skhd --install-service

# 5. Reiniciar servicios
yabai --start-service
skhd --start-service

# 6. Limpiar permisos antiguos en Configuración del Sistema
# Ve a: Configuración > Privacidad y Seguridad > Accesibilidad
# Elimina entradas antiguas de yabai/skhd (sin icono)
# Agrega las nuevas cuando se te pida
```

### Skhd no responde a atajos de teclado

```bash
# 1. Verificar que skhd está corriendo
ps aux | grep skhd

# 2. Ver logs para errores
tail -f /tmp/skhd_$USER.out.log
tail -f /tmp/skhd_$USER.err.log

# 3. Verificar sintaxis del archivo de configuración
skhd --check

# 4. Reiniciar skhd con verbose
skhd --stop-service
skhd --verbose --start-service

# 5. Verificar permisos de Accesibilidad
# Configuración > Privacidad y Seguridad > Accesibilidad
# Asegúrate de que skhd está marcado
```

### Yabai crashea o no mueve ventanas

```bash
# 1. Ver logs
tail -f /tmp/yabai_$USER.out.log
tail -f /tmp/yabai_$USER.err.log

# 2. Verificar configuración
yabai --check

# 3. Deshabilitar SIP (System Integrity Protection) para funciones avanzadas
# Reinicia en Recovery Mode (Cmd+R al iniciar)
# Terminal > csrutil disable
# Reinicia normalmente

# 4. Instalar scripting addition (para funciones avanzadas)
# Primero deshabilita SIP (paso 3)
sudo yabai --load-sa
yabai --restart-service

# 5. Reset completo
killall yabai
rm -rf ~/.yabai*
yabai --start-service
```

---

## 🎨 SketchyBar

### SketchyBar no se ve después de instalación

```bash
# 1. Verificar que está corriendo
ps aux | grep sketchybar

# 2. Iniciar manualmente
sketchybar --reload

# 3. Ver errores
tail -f /tmp/sketchybar_$USER.out.log
tail -f /tmp/sketchybar_$USER.err.log

# 4. Configurar para inicio automático
brew services start sketchybar
# O con el nuevo método:
sketchybar --start-service
```

### Plugins de SketchyBar no funcionan

```bash
# 1. Verificar permisos de plugins
chmod +x ~/.config/sketchybar/plugins/*

# 2. Verificar dependencias
brew list | grep -E "jq|sf-symbols|font-hack-nerd-font"

# 3. Instalar dependencias faltantes
brew install jq
brew install --cask sf-symbols
brew install --cask font-hack-nerd-font

# 4. Recargar
sketchybar --reload
```

### SketchyBar conflicto con barra del sistema

```bash
# Ocultar barra del sistema de macOS automáticamente
# En ~/.config/sketchybar/sketchybarrc agrega:

# Ocultar dock y menu bar automáticamente
yabai -m config external_bar all:32:0

# O puedes hacerlo manualmente:
# Configuración del Sistema > Escritorio y Dock
# - Ocultar el Dock automáticamente: ON
# - Ocultar la barra de menús automáticamente: ON
```

---

## 🔐 Permisos y Seguridad

### Lista de Permisos Necesarios

1. **Accesibilidad** (Accessibility)
   - ✅ yabai
   - ✅ skhd
   - ✅ Terminal (o iTerm2, Alacritty, etc.)

2. **Automatización** (Automation)
   - ✅ Terminal puede controlar "System Events"

3. **Screen Recording** (grabación de pantalla)
   - ✅ yabai (solo si usas algunas funciones avanzadas)

### Cómo configurar permisos (macOS Sequoia/Sonoma)

```bash
# Abrir preferencias de seguridad directamente
open "x-apple.systempreferences:com.apple.preference.security?Privacy_Accessibility"

# O navega manualmente:
# Configuración del Sistema > Privacidad y Seguridad > Accesibilidad
```

**Pasos**:
1. Click en el candado 🔒 para hacer cambios
2. Ingresa tu contraseña
3. Click en "+" para agregar aplicación
4. Navega a `/usr/local/bin/` o `/opt/homebrew/bin/`
5. Selecciona `yabai` y `skhd`
6. Marca las casillas para habilitarlos

### Resetear permisos después de actualización

```bash
# Script para resetear todos los permisos
cat > ~/reset-permissions.sh << 'EOF'
#!/bin/bash

echo "🔄 Reseteando permisos de yabai y skhd"

# Detener servicios
yabai --stop-service
skhd --stop-service

# Encontrar ubicación de binarios
YABAI_PATH=$(which yabai)
SKHD_PATH=$(which skhd)

echo "Yabai ubicado en: $YABAI_PATH"
echo "Skhd ubicado en: $SKHD_PATH"

# Resetear permisos TCC
tccutil reset Accessibility
tccutil reset AppleEvents

echo ""
echo "✅ Permisos reseteados"
echo ""
echo "⚠️  IMPORTANTE: Ahora debes:"
echo "1. Reiniciar servicios: yabai --start-service && skhd --start-service"
echo "2. Ir a Configuración > Privacidad > Accesibilidad"
echo "3. Agregar y habilitar yabai y skhd cuando se te pida"
echo ""
EOF

chmod +x ~/reset-permissions.sh
```

---

## ⚡ Soluciones Rápidas

### Script de Diagnóstico Completo

```bash
cat > ~/diagnose-setup.sh << 'EOF'
#!/bin/bash

echo "🔍 Diagnóstico Completo del Setup"
echo "=================================="
echo ""

# 1. Versiones
echo "📦 VERSIONES:"
echo "  Homebrew: $(brew --version | head -1)"
echo "  Yabai: $(yabai --version 2>/dev/null || echo 'No instalado')"
echo "  Skhd: $(skhd --version 2>/dev/null || echo 'No instalado')"
echo "  SketchyBar: $(sketchybar --version 2>/dev/null || echo 'No instalado')"
echo ""

# 2. Servicios corriendo
echo "🔄 SERVICIOS:"
if pgrep -x yabai > /dev/null; then
    echo "  ✅ Yabai: Corriendo (PID: $(pgrep -x yabai))"
else
    echo "  ❌ Yabai: No corriendo"
fi

if pgrep -x skhd > /dev/null; then
    echo "  ✅ Skhd: Corriendo (PID: $(pgrep -x skhd))"
else
    echo "  ❌ Skhd: No corriendo"
fi

if pgrep -x sketchybar > /dev/null; then
    echo "  ✅ SketchyBar: Corriendo (PID: $(pgrep -x sketchybar))"
else
    echo "  ❌ SketchyBar: No corriendo"
fi
echo ""

# 3. Archivos de configuración
echo "📄 CONFIGURACIÓN:"
[ -f ~/.yabairc ] && echo "  ✅ ~/.yabairc existe" || echo "  ❌ ~/.yabairc no existe"
[ -f ~/.skhdrc ] && echo "  ✅ ~/.skhdrc existe" || echo "  ❌ ~/.skhdrc no existe"
[ -d ~/.config/sketchybar ] && echo "  ✅ ~/.config/sketchybar existe" || echo "  ❌ ~/.config/sketchybar no existe"
echo ""

# 4. Permisos ejecutables
echo "🔑 PERMISOS:"
[ -x ~/.yabairc ] && echo "  ✅ ~/.yabairc es ejecutable" || echo "  ⚠️  ~/.yabairc no es ejecutable"
[ -x ~/.skhdrc ] && echo "  ✅ ~/.skhdrc es ejecutable" || echo "  ⚠️  ~/.skhdrc no es ejecutable"
echo ""

# 5. Logs recientes
echo "📋 LOGS RECIENTES:"
if [ -f /tmp/yabai_$USER.err.log ]; then
    echo "  Yabai errors (últimas 3 líneas):"
    tail -3 /tmp/yabai_$USER.err.log 2>/dev/null | sed 's/^/    /'
fi

if [ -f /tmp/skhd_$USER.err.log ]; then
    echo "  Skhd errors (últimas 3 líneas):"
    tail -3 /tmp/skhd_$USER.err.log 2>/dev/null | sed 's/^/    /'
fi
echo ""

# 6. Conectividad
echo "🌐 CONECTIVIDAD:"
if curl -Is https://github.com --max-time 5 | head -1 | grep -q 200; then
    echo "  ✅ GitHub: Accesible"
else
    echo "  ❌ GitHub: No accesible"
fi
echo ""

echo "=================================="
echo "Diagnóstico completado"
echo ""
echo "💡 ACCIONES SUGERIDAS:"
echo ""

if ! pgrep -x yabai > /dev/null; then
    echo "  • Iniciar yabai: yabai --start-service"
fi

if ! pgrep -x skhd > /dev/null; then
    echo "  • Iniciar skhd: skhd --start-service"
fi

if [ ! -x ~/.yabairc ]; then
    echo "  • Hacer yabairc ejecutable: chmod +x ~/.yabairc"
fi

if [ ! -x ~/.skhdrc ]; then
    echo "  • Hacer skhdrc ejecutable: chmod +x ~/.skhdrc"
fi

echo ""
EOF

chmod +x ~/diagnose-setup.sh
~/diagnose-setup.sh
```

### Reinicio Completo del Setup

```bash
cat > ~/reset-complete-setup.sh << 'EOF'
#!/bin/bash

echo "⚠️  ADVERTENCIA: Esto reiniciará completamente tu setup"
read -p "¿Estás seguro? (y/n) " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    exit 1
fi

echo "🔄 Reiniciando setup completo..."

# 1. Detener todos los servicios
echo "Deteniendo servicios..."
yabai --stop-service 2>/dev/null
skhd --stop-service 2>/dev/null
sketchybar --exit 2>/dev/null
killall yabai skhd sketchybar 2>/dev/null

# 2. Desinstalar servicios
echo "Desinstalando servicios..."
yabai --uninstall-service 2>/dev/null
skhd --uninstall-service 2>/dev/null

# 3. Limpiar logs
echo "Limpiando logs..."
rm -f /tmp/yabai_$USER.* /tmp/skhd_$USER.* /tmp/sketchybar_$USER.*

# 4. Reinstalar servicios
echo "Reinstalando servicios..."
yabai --install-service
skhd --install-service

# 5. Reiniciar servicios
echo "Iniciando servicios..."
yabai --start-service
skhd --start-service
sketchybar 2>/dev/null &

echo ""
echo "✅ Reset completado!"
echo ""
echo "⚠️  IMPORTANTE: Verifica permisos en:"
echo "   Configuración > Privacidad y Seguridad > Accesibilidad"
echo ""
EOF

chmod +x ~/reset-complete-setup.sh
```

---

## 📚 Recursos Adicionales

### Documentación Oficial
- [Yabai Wiki](https://github.com/koekeishiya/yabai/wiki)
- [Skhd GitHub](https://github.com/koekeishiya/skhd)
- [SketchyBar Docs](https://felixkratz.github.io/SketchyBar/)

### Configuraciones de Ejemplo (2025)
- [linkarzu/macos-ricing](https://github.com/linkarzu/dotfiles-latest) - Setup completo 2025
- [FelixKratz dotfiles](https://github.com/FelixKratz/dotfiles) - Del creador de SketchyBar
- [julian-heng/yabai-config](https://github.com/julian-heng/yabai-config) - Config minimalista

### Comunidad
- [r/yabai](https://reddit.com/r/yabai) - Subreddit oficial
- [Yabai Discord](https://discord.gg/yabai)

---

## 🆘 Última Opción: Instalación Manual

Si todo lo demás falla, instala manualmente:

```bash
# Crear directorio temporal
cd /tmp
mkdir -p manual-install && cd manual-install

# Descargar releases más recientes
curl -L https://github.com/koekeishiya/yabai/releases/latest/download/yabai.tar.gz -o yabai.tar.gz
curl -L https://github.com/koekeishiya/skhd/releases/latest/download/skhd.tar.gz -o skhd.tar.gz

# Extraer
tar -xzf yabai.tar.gz
tar -xzf skhd.tar.gz

# Mover a /usr/local/bin
sudo mkdir -p /usr/local/bin
sudo mv yabai /usr/local/bin/
sudo mv skhd /usr/local/bin/

# Dar permisos
sudo chmod +x /usr/local/bin/yabai
sudo chmod +x /usr/local/bin/skhd

# Crear archivos de servicio manualmente
mkdir -p ~/Library/LaunchAgents

# yabai plist
cat > ~/Library/LaunchAgents/com.koekeishiya.yabai.plist << 'PLIST'
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>com.koekeishiya.yabai</string>
    <key>ProgramArguments</key>
    <array>
        <string>/usr/local/bin/yabai</string>
    </array>
    <key>RunAtLoad</key>
    <true/>
    <key>KeepAlive</key>
    <true/>
    <key>StandardOutPath</key>
    <string>/tmp/yabai_$USER.out.log</string>
    <key>StandardErrorPath</key>
    <string>/tmp/yabai_$USER.err.log</string>
</dict>
</plist>
PLIST

# skhd plist
cat > ~/Library/LaunchAgents/com.koekeishiya.skhd.plist << 'PLIST'
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>com.koekeishiya.skhd</string>
    <key>ProgramArguments</key>
    <array>
        <string>/usr/local/bin/skhd</string>
    </array>
    <key>RunAtLoad</key>
    <true/>
    <key>KeepAlive</key>
    <true/>
    <key>StandardOutPath</key>
    <string>/tmp/skhd_$USER.out.log</string>
    <key>StandardErrorPath</key>
    <string>/tmp/skhd_$USER.err.log</string>
</dict>
</plist>
PLIST

# Cargar servicios
launchctl load ~/Library/LaunchAgents/com.koekeishiya.yabai.plist
launchctl load ~/Library/LaunchAgents/com.koekeishiya.skhd.plist

echo "✅ Instalación manual completada"
echo "Configura permisos en: Configuración > Privacidad > Accesibilidad"
```

---

**Última actualización**: Noviembre 2025
**Versión**: 2.0
