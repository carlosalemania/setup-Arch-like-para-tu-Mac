<div align="center">

# 🚀 Setup Arch-like para macOS

### Transforma tu Mac en un entorno tipo Arch Linux + Hyprland (2025)

[![macOS](https://img.shields.io/badge/macOS-Tahoe-blue?logo=apple)](https://www.apple.com/macos/)
[![Yabai](https://img.shields.io/badge/Yabai-v7.1.16-green)](https://github.com/koekeishiya/yabai)
[![Skhd](https://img.shields.io/badge/Skhd-v0.3.9-orange)](https://github.com/koekeishiya/skhd)
[![License](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Last Updated](https://img.shields.io/badge/Updated-Nov_2025-red)]()

[📖 Guías Completas](#-documentación) · [⚡ Instalación Rápida](#-instalación-rápida) · [🎮 Atajos](#-atajos-de-teclado-principales) · [🐛 Troubleshooting](#-troubleshooting)

</div>

---

## 📋 Tabla de Contenidos

- [✨ Características](#-características)
- [📦 Componentes Instalados](#-componentes-instalados)
- [⚡ Instalación Rápida](#-instalación-rápida)
- [🔧 Configuración Post-Instalación](#-configuración-post-instalación)
- [🎮 Atajos de Teclado](#-atajos-de-teclado-principales)
- [📚 Documentación Completa](#-documentación)
- [🛠️ Herramientas CLI Modernas](#-herramientas-cli-modernas-2025)
- [🎨 Personalización](#-personalización)
- [🐛 Troubleshooting](#-troubleshooting)
- [🤝 Contribuir](#-contribuir)

---

## ✨ Características

<table>
<tr>
<td width="50%">

### 🪟 Window Management
- ✅ Tiling automático estilo i3/Hyprland
- ✅ Navegación vim-style (hjkl)
- ✅ Soporte multi-monitor
- ✅ Workspaces dinámicos
- ✅ Atajos personalizables

</td>
<td width="50%">

### 🛠️ CLI Tools 2025
- ✅ Modern replacements (eza, bat, fzf)
- ✅ Zsh con plugins avanzados
- ✅ Tmux configurado
- ✅ Git workflows optimizados
- ✅ Aliases tipo Arch Linux

</td>
</tr>
<tr>
<td width="50%">

### 🎨 Temas & Personalización
- ✅ Warp Terminal temas neón
- ✅ btop con 4 temas épicos
- ✅ Bordes rosa neón (JankyBorders)
- ✅ Gradientes personalizados
- ✅ Paleta cyberpunk

</td>
<td width="50%">

### 🔥 Bordes de Ventana
- ✅ Rosa neón (#ff0080)
- ✅ 6px grosor redondeado
- ✅ Blur suave profesional
- ✅ Auto-detección ventana activa
- ✅ Personalizable por color

</td>
</tr>
</table>

---

## 📦 Componentes Instalados

### 🪟 Window Manager
| Componente | Versión | Descripción |
|------------|---------|-------------|
| **Yabai** | v7.1.16 | Tiling window manager (BSP) |
| **Skhd** | v0.3.9 | Hotkey daemon |
| **JankyBorders** | v1.8.4 | Bordes de ventana personalizados |
| **SketchyBar** | v2.23.0 | Status bar personalizable |

### 🎨 Temas & Terminal
| Componente | Descripción |
|------------|-------------|
| **Warp Terminal** | Terminal moderna con temas neón |
| **btop** | Monitor del sistema con 4 temas épicos |
| **Temas Warp** | Neon Fire Tokyo, Cyberpunk Fire |
| **Temas btop** | Dracula, Cyberpunk, Tokyo Night, Matrix |

### 🛠️ Herramientas CLI
| Herramienta | Reemplaza | Mejora |
|-------------|-----------|--------|
| **eza** | ls | Íconos + Git info |
| **bat** | cat | Syntax highlighting |
| **zoxide** | cd | Navegación inteligente |
| **fzf** | find | Búsqueda fuzzy |
| **ripgrep** | grep | 10x más rápido |
| **fd** | find | Búsqueda simple |
| **btop** | htop | Monitor visual |
| **delta** | diff | Git diff mejorado |

### 🔧 Configuraciones
- ✅ `.yabairc` - Configuración de yabai
- ✅ `.skhdrc` - Atajos de teclado
- ✅ `.zshrc` - Shell con plugins modernos
- ✅ `.tmux.conf` - Tmux configurado
- ✅ Scripts de automatización

---

## ⚡ Instalación Rápida

### Prerrequisitos
```bash
# Instalar Homebrew si no lo tienes
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### Instalación Automática (Recomendado)

```bash
# 1. Clonar repositorio
git clone https://github.com/carlosalemania/setup-Arch-like-para-tu-Mac.git
cd setup-Arch-like-para-tu-Mac

# 2. Ejecutar instalación
chmod +x install-arch-macos-fixed.sh
./install-arch-macos-fixed.sh

# 3. Iniciar servicios
./start-wm.sh
```

<details>
<summary><b>📝 Instalación Manual (click para expandir)</b></summary>

```bash
# Instalar Yabai y Skhd
brew install koekeishiya/formulae/yabai
brew install koekeishiya/formulae/skhd

# Instalar herramientas CLI
brew install eza bat zoxide fzf ripgrep fd btop delta
brew install powerlevel10k zsh-autosuggestions zsh-syntax-highlighting
brew install thefuck tldr yazi

# Copiar configuraciones
cp .yabairc ~/.yabairc
cp .skhdrc ~/.skhdrc
cp .zshrc ~/.zshrc
cp .tmux.conf ~/.tmux.conf

# Iniciar servicios
yabai --start-service
skhd --start-service
```

</details>

---

## 🔧 Configuración Post-Instalación

### 1️⃣ Configurar Permisos de Accesibilidad ⚠️ CRÍTICO

Los servicios **NO FUNCIONARÁN** sin estos permisos:

```bash
# Abrir Configuración del Sistema
open "x-apple.systempreferences:com.apple.preference.security?Privacy_Accessibility"
```

**Pasos:**
1. Ve a **Privacidad y Seguridad** > **Accesibilidad**
2. Click en el **candado 🔒** (ingresa contraseña)
3. Click en **"+"** y agrega:
   - `/opt/homebrew/bin/yabai` (Apple Silicon)
   - `/opt/homebrew/bin/skhd`
   - Tu aplicación de Terminal
4. ✅ Marca las casillas para habilitarlos

### 2️⃣ Crear Workspaces en Mission Control

1. Abre **Mission Control** (F3 o swipe 3 dedos arriba)
2. Mueve cursor a la parte superior
3. Click en **"+"** para agregar espacios
4. Crea **6 espacios** para usar con atajos

### 3️⃣ Verificar Estado

```bash
# Ver estado de servicios
wm-status

# Ver logs en tiempo real
tail -f /tmp/yabai_$USER.err.log
tail -f /tmp/skhd_$USER.err.log
```

---

## 🎮 Atajos de Teclado Principales

### 🚀 Lanzar Aplicaciones
| Atajo | Acción |
|-------|--------|
| `Cmd + Shift + Return` | Terminal |
| `Cmd + Shift + B` | Navegador |
| `Cmd + Shift + E` | Finder |

### 🧭 Navegación de Ventanas
| Atajo | Acción |
|-------|--------|
| `Cmd + Shift + H/J/K/L` | Mover foco (izq/abajo/arriba/der) |
| `Cmd + Shift + ←/↓/↑/→` | Mover foco (con flechas) |

### 🔄 Mover Ventanas
| Atajo | Acción |
|-------|--------|
| `Cmd + Ctrl + Shift + H/J/K/L` | Swap ventanas |
| `Ctrl + Alt + H/J/K/L` | Warp (mover y dividir) |
| `Alt + S/G` | Cambiar entre monitores |

### 🖥️ Workspaces
| Atajo | Acción |
|-------|--------|
| `Cmd + Shift + 1-6` | Ir a workspace 1-6 |
| `Cmd + Ctrl + Shift + 1-6` | Mover ventana a workspace |
| `Cmd + Shift + N/P` | Workspace siguiente/anterior |

### 📐 Layouts
| Atajo | Acción |
|-------|--------|
| `Cmd + Shift + Space` | Toggle BSP/Float |
| `Cmd + Shift + F` | Fullscreen |
| `Cmd + Shift + R` | Rotar 90° |
| `Cmd + Shift + 0` | Balancear ventanas |

### ⚙️ Sistema
| Atajo | Acción |
|-------|--------|
| `Cmd + Ctrl + Shift + R` | Reiniciar yabai |
| `Cmd + Shift + Q` | Cerrar ventana |
| `Cmd + Shift + S` | Screenshot |
| `Cmd + Shift + Escape` | Bloquear pantalla |

<details>
<summary><b>🎹 Ver todos los atajos avanzados</b></summary>

### Multi-Monitor
- `Ctrl + Alt + 1/2/3` - Enfocar monitor específico

### Crear/Destruir Espacios
- `Cmd + Alt + N` - Crear nuevo espacio
- `Cmd + Alt + W` - Destruir espacio actual

### Redimensionar
- `Cmd + Alt + H/J/K/L` - Expandir ventana
- `Cmd + Alt + Shift + H/J/K/L` - Contraer ventana

</details>

---

## 📚 Documentación

Este repositorio incluye guías completas:

| Archivo | Descripción |
|---------|-------------|
| 📖 [arch-macos-setup-2025.md](arch-macos-setup-2025.md) | Guía completa paso a paso |
| 🔧 [TROUBLESHOOTING-2025.md](TROUBLESHOOTING-2025.md) | Solución de todos los errores comunes |
| ✨ [WHATS-NEW-2025.md](WHATS-NEW-2025.md) | Novedades y cambios 2025 |
| 📊 [sales-workflow-cli-guide.md](sales-workflow-cli-guide.md) | Comandos CLI para workflows de ventas |
| 📝 [SOLUCION-RAPIDA.md](SOLUCION-RAPIDA.md) | Soluciones rápidas a problemas comunes |
| 📋 [INDEX.md](INDEX.md) | Índice completo de documentación |
| 🎉 [INSTALACION-COMPLETADA.md](INSTALACION-COMPLETADA.md) | Guía post-instalación |
| 🔍 [MEJORAS-JOSEAN-DEV.md](MEJORAS-JOSEAN-DEV.md) | Análisis comparativo con otros setups |

---

## 🛠️ Herramientas CLI Modernas (2025)

### Aliases Arch-Style

```bash
# Gestión de paquetes (estilo pacman)
pacman-S <package>      # brew install
pacman-R <package>      # brew uninstall
pacman-Syu              # brew update && upgrade
pacman-Ss <term>        # brew search

# Modern CLI replacements
ls                      # → eza --icons
cat                     # → bat
cd                      # → z (zoxide)
find                    # → fd
grep                    # → rg (ripgrep)

# Git shortcuts
gs                      # git status
ga                      # git add
gc                      # git commit
gp                      # git push
gl                      # git log --oneline --graph

# Window Manager
wm-status              # Ver estado de yabai/skhd
wm-reload              # Recargar configuración
ystart/ystop           # Iniciar/detener yabai
sstart/sstop           # Iniciar/detener skhd
```

### Funciones Útiles

```bash
# Crear directorio y entrar
mkcd nombre/

# Extraer cualquier archivo
extract archivo.tar.gz

# Matar proceso en puerto
killport 3000

# Backup rápido
backup archivo.txt

# Ver IP pública
myip

# Ver clima
weather
```

---

## 🎨 Personalización

### Editar Configuraciones

```bash
# Atajos de teclado
nvim ~/.skhdrc
skhd --restart-service

# Comportamiento de ventanas
nvim ~/.yabairc
yabai --restart-service

# Shell y aliases
nvim ~/.zshrc
source ~/.zshrc

# Tmux
nvim ~/.tmux.conf
```

### Temas y Apariencia

```bash
# FZF con tema Catppuccin Mocha (ya configurado)
# eza con íconos (ya configurado)
# bat con syntax highlighting (ya configurado)

# Powerlevel10k - Reconfigurar prompt
p10k configure
```

---

## 🐛 Troubleshooting

### Problemas Comunes

<details>
<summary><b>❌ Yabai no responde</b></summary>

```bash
# Ver errores
tail -20 /tmp/yabai_$USER.err.log

# Reiniciar servicio
yabai --stop-service
yabai --start-service

# Verificar permisos de Accesibilidad
open "x-apple.systempreferences:com.apple.preference.security?Privacy_Accessibility"
```

</details>

<details>
<summary><b>❌ Skhd no detecta atajos</b></summary>

```bash
# Verificar sintaxis
skhd --check

# Ver errores
tail -20 /tmp/skhd_$USER.err.log

# Reiniciar
skhd --restart-service

# Verificar permisos de Accesibilidad (CRÍTICO)
```

</details>

<details>
<summary><b>❌ Servicios no inician</b></summary>

**Causa más común:** Falta permisos de Accesibilidad

1. Ve a: Configuración > Privacidad > Accesibilidad
2. Elimina entradas viejas/sin icono
3. Agrega yabai, skhd y tu terminal
4. Reinicia servicios

</details>

<details>
<summary><b>❌ GitHub connection timeout</b></summary>

```bash
# Verificar conectividad
ping github.com

# Limpiar cache DNS
sudo dscacheutil -flushcache && sudo killall -HUP mDNSResponder

# Configurar Git timeouts
git config --global http.postBuffer 524288000
git config --global http.lowSpeedLimit 1000
git config --global http.lowSpeedTime 600
```

</details>

### 📖 Documentación Completa
Para más soluciones, lee [TROUBLESHOOTING-2025.md](TROUBLESHOOTING-2025.md)

---

## 🔄 Mantenimiento

```bash
# Actualizar todo el sistema
update                 # alias para brew update && upgrade && cleanup

# Ver estado de servicios
wm-status

# Recargar configuraciones
wm-reload

# Limpiar cache de Homebrew
brew cleanup -s
```

---

## 🎯 Roadmap

- [x] Instalación automatizada
- [x] Documentación completa en español
- [x] Scripts de troubleshooting
- [x] Herramientas CLI modernas
- [x] Configuración de Tmux
- [x] Soporte multi-monitor
- [ ] Configuración de SketchyBar personalizada
- [ ] Video tutoriales
- [ ] Alternativa con AeroSpace (sin SIP)
- [ ] Dotfiles manager integrado

---

## 🌟 Inspiración

Este setup está inspirado en:
- [josean-dev/dev-environment-files](https://github.com/josean-dev/dev-environment-files)
- [linkarzu/dotfiles-latest](https://github.com/linkarzu/dotfiles-latest)
- [FelixKratz/dotfiles](https://github.com/FelixKratz/dotfiles)
- [r/unixporn](https://reddit.com/r/unixporn)

---

## 🤝 Contribuir

¿Encontraste un bug? ¿Tienes una mejora? ¡Contribuciones son bienvenidas!

1. Fork este repositorio
2. Crea una rama: `git checkout -b feature/mejora`
3. Commit cambios: `git commit -m 'Agregar mejora'`
4. Push: `git push origin feature/mejora`
5. Abre un Pull Request

---

## 📞 Recursos y Comunidad

### Documentación Oficial
- [Yabai Wiki](https://github.com/koekeishiya/yabai/wiki)
- [Skhd Repository](https://github.com/koekeishiya/skhd)
- [Homebrew Documentation](https://docs.brew.sh/)

### Comunidad
- [Discord Yabai](https://discord.gg/yabai)
- [r/yabai](https://reddit.com/r/yabai)
- [GitHub Discussions](https://github.com/koekeishiya/yabai/discussions)

---

## 📄 Licencia

Este proyecto está bajo licencia MIT. Eres libre de usar, modificar y distribuir.

---

<div align="center">

### 🎉 ¡Disfruta tu nuevo entorno tipo Arch Linux en macOS!

**¿Te gustó este setup? ¡Dale una ⭐ al repositorio!**

*Última actualización: Noviembre 2025*
*Versión: 2.0*

[⬆ Volver arriba](#-setup-arch-like-para-macos)

</div>
