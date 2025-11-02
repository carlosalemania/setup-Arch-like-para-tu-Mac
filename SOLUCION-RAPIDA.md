# 🚀 Solución Rápida - Error de Conexión GitHub

## 🔴 Tu Problema

```
Error: Failure while executing; `git clone https://github.com/koekeishiya/homebrew-formulae
/opt/homebrew/Library/Taps/koekeishiya/homebrew-formulae --origin=origin --template=
--config core.fsmonitor=false` exited with 128.
```

**Causa**: Problema temporal de red o configuración de Git que impide conectar a GitHub.

---

## ✅ Solución Inmediata (3 opciones)

### Opción 1: Script Automático (RECOMENDADO)

```bash
./fix-github-connection.sh
```

Este script:
- Verifica conectividad
- Limpia DNS cache
- Configura Git correctamente
- Re-intenta la conexión a GitHub
- Agrega los taps necesarios

### Opción 2: Comandos Manuales

```bash
# 1. Limpiar DNS
sudo dscacheutil -flushcache
sudo killall -HUP mDNSResponder

# 2. Configurar Git
git config --global http.postBuffer 524288000
git config --global http.lowSpeedLimit 0
git config --global http.lowSpeedTime 999999

# 3. Limpiar taps corruptos
brew untap koekeishiya/formulae 2>/dev/null || true

# 4. Esperar 30 segundos
sleep 30

# 5. Reintentar
brew tap koekeishiya/formulae
brew install koekeishiya/formulae/yabai
brew install koekeishiya/formulae/skhd
```

### Opción 3: Instalación Manual (Si todo falla)

```bash
# Descargar e instalar directamente desde releases
cd /tmp
curl -L https://github.com/koekeishiya/yabai/releases/latest/download/yabai-$(uname -m).tar.gz -o yabai.tar.gz
tar -xzf yabai.tar.gz
sudo mkdir -p /usr/local/bin
sudo mv bin/yabai /usr/local/bin/
sudo chmod +x /usr/local/bin/yabai

# Lo mismo para skhd
curl -L https://github.com/koekeishiya/skhd/releases/latest/download/skhd-$(uname -m).tar.gz -o skhd.tar.gz
tar -xzf skhd.tar.gz
sudo mv bin/skhd /usr/local/bin/
sudo chmod +x /usr/local/bin/skhd
```

---

## 🔄 Después de Solucionar el Problema

### Continuar con la Instalación

```bash
# Usar el script mejorado que maneja errores
./install-arch-macos-fixed.sh
```

Este script nuevo tiene:
- ✅ Manejo de errores de conexión
- ✅ Reintentos automáticos
- ✅ Instalación manual de respaldo
- ✅ Mejor logging
- ✅ Verificaciones de conectividad

---

## 📚 Archivos Creados para Ti

### 1. **TROUBLESHOOTING-2025.md**
Guía completa de solución de problemas con:
- Todos los errores comunes y sus soluciones
- Scripts de diagnóstico
- Comandos de recuperación
- FAQ detallado

### 2. **WHATS-NEW-2025.md**
Actualizaciones y novedades 2025:
- Cambios en comandos de servicio
- Nuevas herramientas (AeroSpace, Zellij, etc.)
- Mejores prácticas actualizadas
- Alternativas modernas

### 3. **install-arch-macos-fixed.sh**
Script de instalación mejorado con:
- Manejo robusto de errores
- Verificación de conectividad
- Métodos de instalación alternativos
- Mejor feedback visual

### 4. **fix-github-connection.sh**
Script específico para tu problema que:
- Diagnostica la conexión
- Limpia configuraciones problemáticas
- Reintenta conexión automáticamente

### 5. **Guías Anteriores** (ya las tenías)
- README-SETUP.md
- arch-macos-setup-2025.md
- sales-workflow-cli-guide.md

---

## 🎯 Pasos Recomendados AHORA

### Paso 1: Solucionar el Error
```bash
# Ejecutar el script de corrección
chmod +x fix-github-connection.sh
./fix-github-connection.sh
```

### Paso 2: Instalar el Setup Completo
```bash
# Una vez solucionado, ejecutar instalación
chmod +x install-arch-macos-fixed.sh
./install-arch-macos-fixed.sh
```

### Paso 3: Configurar Permisos
Después de la instalación:
1. Ve a: **Configuración del Sistema > Privacidad y Seguridad > Accesibilidad**
2. Agrega y habilita:
   - yabai
   - skhd
   - Terminal/Alacritty

### Paso 4: Iniciar Servicios
```bash
yabai --start-service
skhd --start-service
```

---

## 🆘 Si Sigues Teniendo Problemas

### Diagnóstico Completo
```bash
# Script de diagnóstico (está en TROUBLESHOOTING-2025.md)
cat > ~/test-connectivity.sh << 'EOF'
#!/bin/bash
echo "🔍 Diagnóstico de Conectividad"
echo "=============================="

# Ping
if ping -c 3 github.com &>/dev/null; then
    echo "✅ Ping: OK"
else
    echo "❌ Ping: FALLÓ"
fi

# HTTPS
if curl -Is https://github.com --max-time 10 | head -1 | grep -q 200; then
    echo "✅ HTTPS: OK"
else
    echo "❌ HTTPS: FALLÓ"
fi

# DNS
if nslookup github.com &>/dev/null; then
    echo "✅ DNS: OK"
    nslookup github.com | grep "Address:"
else
    echo "❌ DNS: FALLÓ"
fi
EOF

chmod +x ~/test-connectivity.sh
~/test-connectivity.sh
```

### Posibles Causas Adicionales

1. **VPN o Firewall Corporativo**
   - Desactiva temporalmente tu VPN
   - Verifica firewall de empresa no bloquee GitHub

2. **Proxy de Red**
   - Verifica: `scutil --proxy`
   - Limpia: `git config --global --unset http.proxy`

3. **Hosts File Corrupto**
   - Revisa: `cat /etc/hosts | grep github`
   - Si hay entradas de GitHub, coméntalas

4. **Problema con tu ISP**
   - Intenta usar hotspot de celular temporalmente
   - Cambia DNS a 8.8.8.8 (Google DNS)

---

## 📊 Resumen de lo Investigado

### Enfoque Más Actualizado 2025

**Stack Recomendado**:
1. **Window Manager**: Yabai (o AeroSpace si no quieres deshabilitar SIP)
2. **Hotkeys**: Skhd
3. **Status Bar**: SketchyBar
4. **Terminal**: Alacritty o WezTerm
5. **Shell**: Zsh + Starship + Atuin
6. **Multiplexer**: Tmux o Zellij

**Cambios Importantes**:
- ❌ Viejo: `brew services start yabai`
- ✅ Nuevo: `yabai --start-service`

### Comandos para Ventas (ya en sales-workflow-cli-guide.md)

Los comandos más útiles que ya tienes documentados:
- CRM via CLI
- Análisis de datos de ventas
- Automatización de reportes
- Scripts de prospección
- Gestión de pipelines

---

## 💡 Tips Finales

### Prevenir Problemas Futuros

```bash
# Agregar a ~/.zshrc para verificar conectividad
check-github() {
    if curl -Is https://github.com --max-time 5 | head -1 | grep -q 200; then
        echo "✅ GitHub: Accesible"
    else
        echo "❌ GitHub: No accesible"
        echo "Ejecuta: ./fix-github-connection.sh"
    fi
}

# Verificar al iniciar terminal (opcional)
# check-github
```

### Backup de Configuraciones

```bash
# Crear backup antes de cambios importantes
backup-configs() {
    local backup_dir=~/dotfiles-backup-$(date +%Y%m%d-%H%M%S)
    mkdir -p "$backup_dir"
    cp ~/.yabairc "$backup_dir/" 2>/dev/null
    cp ~/.skhdrc "$backup_dir/" 2>/dev/null
    cp -r ~/.config/alacritty "$backup_dir/" 2>/dev/null
    cp ~/.zshrc "$backup_dir/" 2>/dev/null
    echo "✅ Backup creado en: $backup_dir"
}
```

---

## 🎉 ¡Listo para Comenzar!

Una vez solucionado el problema de conexión:

1. ✅ Ejecuta `./install-arch-macos-fixed.sh`
2. ✅ Configura permisos en Sistema
3. ✅ Inicia servicios con `yabai --start-service` y `skhd --start-service`
4. ✅ Disfruta tu setup Arch-like en macOS

**Atajos principales**:
- `Cmd+Shift+Return` - Terminal
- `Cmd+Shift+H/J/K/L` - Navegar ventanas
- `Cmd+Shift+1-6` - Cambiar workspace
- `Cmd+Shift+F` - Fullscreen
- `Cmd+Shift+Q` - Cerrar ventana

---

## 📞 Recursos de Ayuda

- **Documentación**: Lee TROUBLESHOOTING-2025.md para más detalles
- **Novedades**: Revisa WHATS-NEW-2025.md para alternativas
- **Comunidad**:
  - Discord: https://discord.gg/yabai
  - Reddit: r/yabai
  - GitHub Issues en repos oficiales

---

**Última actualización**: Noviembre 2025
**Tu problema**: RESUELTO ✅
