# 🚀 Novedades 2025: Arch-like macOS Setup

**Última actualización**: Noviembre 2025

## 📋 Resumen de Cambios

Este documento describe las actualizaciones más importantes para el setup Arch-like en macOS durante 2025.

---

## 🔥 Lo Más Importante: Cambios en Comandos de Servicio

### ❌ Método Antiguo (2023-2024)
```bash
brew services start yabai
brew services stop yabai
brew services restart yabai

brew services start skhd
brew services stop skhd
```

### ✅ Método Nuevo (2025)
```bash
# Yabai
yabai --start-service
yabai --stop-service
yabai --restart-service
yabai --check-service

# Skhd
skhd --start-service
skhd --stop-service
skhd --restart-service
skhd --check-service
```

**¿Por qué cambió?**
- Mayor control directo sobre los servicios
- Mejor integración con macOS Sequoia/Sonoma
- Menos dependencias de Homebrew services
- Logs más claros y debugging mejorado

---

## 🆕 Nuevas Herramientas Recomendadas para 2025

### 1. **AeroSpace** - Alternativa emergente a Yabai
- Escrito en Swift nativo
- No requiere deshabilitar SIP
- Mejor integración con macOS moderno
- Menos problemas de permisos

```bash
brew install --cask nikitabobko/tap/aerospace
```

**Cuándo usar AeroSpace vs Yabai:**
- ✅ AeroSpace: Si no quieres deshabilitar SIP
- ✅ Yabai: Para máximo control y personalización

### 2. **Rift** - Nuevo tiling window manager
- Minimalista y rápido
- Configuración en JSON
- Sin necesidad de scripting addition

```bash
brew install --cask rift
```

### 3. **JankyBorders** - Bordes de ventana sin SIP
- Alternativa a bordes nativos de yabai
- Funciona sin deshabilitar SIP
- Más opciones de personalización

```bash
brew tap FelixKratz/formulae
brew install borders
```

Configuración:
```bash
borders active_color=0xff81a1c1 \
        inactive_color=0xff3b4252 \
        width=5.0 &
```

---

## 🎨 SketchyBar: Mejoras 2025

### Nuevos Plugins Populares

1. **CPU Temperature Plugin**
```bash
# Requiere osx-cpu-temp
brew install osx-cpu-temp

# Plugin para SketchyBar
cat > ~/.config/sketchybar/plugins/cpu_temp.sh << 'EOF'
#!/bin/bash
TEMP=$(osx-cpu-temp | awk '{print $1}' | sed 's/°C//')
sketchybar --set cpu_temp label="${TEMP}°C"
EOF
chmod +x ~/.config/sketchybar/plugins/cpu_temp.sh
```

2. **WiFi Status con velocidad**
```bash
cat > ~/.config/sketchybar/plugins/wifi.sh << 'EOF'
#!/bin/bash
SSID=$(networksetup -getairportnetwork en0 | cut -d ":" -f 2 | xargs)
if [ "$SSID" = "" ]; then
    sketchybar --set wifi label="Disconnected" icon=󰖪
else
    sketchybar --set wifi label="$SSID" icon=󰖩
fi
EOF
chmod +x ~/.config/sketchybar/plugins/wifi.sh
```

3. **Integración con Aerospace**
```bash
# SketchyBar puede mostrar workspaces de Aerospace
aerospace list-workspaces --all
```

---

## 🔧 Herramientas CLI Nuevas para 2025

### 1. **Zellij** - Alternativa moderna a Tmux
```bash
brew install zellij

# Configuración básica
zellij setup --check
```

**Ventajas sobre Tmux:**
- UI más intuitiva
- Mejor manejo de layouts
- Plugins en WASM
- Multiplexing más fluido

### 2. **Starship** - Prompt moderno (si aún no lo usas)
```bash
brew install starship

# Agregar a ~/.zshrc
echo 'eval "$(starship init zsh)"' >> ~/.zshrc
```

### 3. **Atuin** - Historial de comandos mejorado
```bash
brew install atuin

# Setup
atuin import auto
echo 'eval "$(atuin init zsh)"' >> ~/.zshrc
```

Características:
- Búsqueda fuzzy en historial
- Sync entre máquinas
- Historial con contexto
- Estadísticas de uso

### 4. **Lazygit** - TUI para Git
```bash
brew install lazygit

# Alias útil
echo "alias lg='lazygit'" >> ~/.zshrc
```

### 5. **Yazi** - File manager TUI moderno
```bash
brew install yazi

# Configuración
yazi --setup
```

---

## 📱 Mejoras en la Experiencia de Terminal

### Alacritty 0.13+ (2025)

Nuevas características:
```toml
# ~/.config/alacritty/alacritty.toml

# Nuevas opciones 2025
[terminal.shell]
program = "/bin/zsh"
args = ["-l"]

# Mejor soporte de ligaduras
[font]
size = 13.0
builtin_box_drawing = true

[font.normal]
family = "JetBrainsMono Nerd Font"
style = "Regular"

# Nuevas animaciones suaves
[cursor]
style = { shape = "Block", blinking = "On" }
blink_interval = 750

# Soporte mejorado de imágenes
[terminal]
osc52 = "CopyPaste"

# Hints mejorados (clickeable links)
[[hints.enabled]]
command = "open"
hyperlinks = true
post_processing = true
mouse.enabled = true
```

### WezTerm - Alternativa potente a Alacritty

```bash
brew install --cask wezterm
```

**Por qué considerar WezTerm:**
- Soporte nativo de imágenes
- Multiplexing integrado (como tmux)
- Lua para configuración
- GPU-accelerated
- Ligaduras mejoradas

---

## 🎯 Configuración Recomendada 2025

### Setup Minimalista (Sin SIP deshabilitado)

```bash
# 1. Window Manager: AeroSpace
brew install --cask nikitabobko/tap/aerospace

# 2. Hotkeys: Skhd
brew install koekeishiya/formulae/skhd

# 3. Status Bar: Simple Bar o SketchyBar
brew tap FelixKratz/formulae
brew install sketchybar

# 4. Bordes: JankyBorders
brew install borders

# 5. Terminal: WezTerm o Alacritty
brew install --cask wezterm
```

### Setup Avanzado (Con SIP deshabilitado)

```bash
# 1. Window Manager: Yabai con scripting addition
brew install koekeishiya/formulae/yabai
sudo yabai --load-sa

# 2. Hotkeys: Skhd
brew install koekeishiya/formulae/skhd

# 3. Status Bar: SketchyBar personalizado
brew install sketchybar

# 4. Terminal: Alacritty optimizado
brew install --cask alacritty

# 5. Shell: Zsh + Starship + Atuin
brew install starship atuin zsh-autosuggestions zsh-syntax-highlighting
```

---

## 🔐 Gestión de Permisos en macOS Sequoia

### Nuevo Sistema de Permisos

macOS Sequoia introdujo cambios en el sistema de permisos:

```bash
# Verificar permisos actuales
sqlite3 ~/Library/Application\ Support/com.apple.TCC/TCC.db \
  "SELECT service, client FROM access"

# Resetear permisos específicos (útil después de updates)
tccutil reset Accessibility
tccutil reset AppleEvents
tccutil reset ScreenCapture
```

### Script de Auto-permiso (Experimental)

```bash
# Algunos desarrolladores usan esto, pero Apple puede bloquearlo
# ⚠️ Usa bajo tu propio riesgo

osascript -e 'tell application "System Events"
    tell application process "System Settings"
        click button "Unlock" of window 1
    end tell
end tell'
```

---

## 🌐 Alternativas Emergentes

### 1. **Amethyst** (Actualización 2025)
- Más estable que nunca
- No requiere SIP deshabilitado
- Shortcuts similares a xmonad

```bash
brew install --cask amethyst
```

### 2. **Rectangle Pro**
- Versión paga de Rectangle
- Shortcuts personalizables
- Snapping inteligente

```bash
brew install --cask rectangle-pro
```

### 3. **Loop** - Nueva opción
- Gratis y open source
- Inspirado en Windows PowerToys
- Muy simple de usar

```bash
brew install --cask loop
```

---

## 🚀 Performance y Optimizaciones

### Optimizar Yabai para M3/M4 Chips

```bash
# En ~/.yabairc

# Mejorar performance en Apple Silicon
yabai -m config window_animation_duration 0.15
yabai -m config window_animation_easing ease_out_quint

# Reducir uso de CPU
yabai -m config window_origin_display default
yabai -m config window_topmost off

# Optimizar para displays externos
yabai -m config display_arrangement_order default
```

### Reducir Latencia en Skhd

```bash
# En ~/.skhdrc

# Cargar en modo blacklist (más rápido)
.blacklist [
    "terminal"
    "qutebrowser"
]

# Deshabilitar servicios innecesarios
.load "/path/to/skhdrc"
```

---

## 📊 Monitoring y Debugging

### Nuevas herramientas de diagnóstico 2025

```bash
# 1. Ver uso de recursos de yabai
instruments -t "Time Profiler" -D /tmp/yabai_profile.trace \
  -p $(pgrep yabai)

# 2. Logs más detallados
yabai --verbose --start-service

# 3. Monitor de eventos
log stream --predicate 'process == "yabai"' --level debug

# 4. Estado de ventanas
yabai -m query --windows | jq '.[] | {app, title, space}'
```

---

## 🎨 Temas y Estética 2025

### Catppuccin Theme (Muy popular en 2025)

```bash
# Para Alacritty
git clone https://github.com/catppuccin/alacritty.git \
  ~/.config/alacritty/catppuccin

# Agregar a alacritty.toml
import = ["~/.config/alacritty/catppuccin/catppuccin-mocha.toml"]
```

### Tokyo Night

```bash
# Muy popular para todo el sistema
# Alacritty, NeoVim, SketchyBar, etc.

# Color scheme para yabai borders
yabai -m config active_window_border_color 0xff7aa2f7
yabai -m config normal_window_border_color 0xff3b4261
```

---

## 📚 Recursos Actualizados 2025

### Dotfiles Recomendados

1. **[linkarzu/dotfiles-latest](https://github.com/linkarzu/dotfiles-latest)**
   - Setup completo 2025
   - SketchyBar avanzado
   - Neovim moderno

2. **[FelixKratz/dotfiles](https://github.com/FelixKratz/dotfiles)**
   - Del creador de SketchyBar
   - Configuración de referencia
   - Constantemente actualizado

3. **[Julian-Heng/yabai-config](https://github.com/julian-heng/yabai-config)**
   - Minimalista y eficiente
   - Buen punto de partida

### Comunidades Activas

- **Discord**: [Yabai Official](https://discord.gg/yabai)
- **Reddit**: [r/yabai](https://reddit.com/r/yabai)
- **Reddit**: [r/unixporn](https://reddit.com/r/unixporn) (para inspiración visual)
- **GitHub Discussions**: En repos oficiales

---

## ⚡ Quick Commands 2025

```bash
# Alias modernos recomendados para .zshrc

# System
alias ls='eza --icons'
alias cat='bat'
alias find='fd'
alias grep='rg'
alias ps='procs'
alias du='dust'
alias df='duf'

# Git con Lazygit
alias lg='lazygit'
alias gs='git status'
alias gd='git diff'

# Window Manager
alias ystart='yabai --start-service'
alias ystop='yabai --stop-service'
alias yr='yabai --restart-service'
alias ys='yabai -m query --spaces | jq'
alias yw='yabai -m query --windows | jq'

# SketchyBar
alias sbr='sketchybar --reload'
alias sbe='sketchybar --exit'

# Tmux/Zellij
alias ta='tmux attach'
alias zj='zellij'

# Quick edit configs
alias evrc='nvim ~/.yabairc'
alias esrc='nvim ~/.skhdrc'
alias ezrc='nvim ~/.zshrc'
alias earc='nvim ~/.config/alacritty/alacritty.toml'

# System info
alias sysinfo='neofetch'
alias cpuinfo='sysctl -n machdep.cpu.brand_string'
alias meminfo='vm_stat'
```

---

## 🔮 Tendencias Futuras (2025-2026)

### Lo que viene:

1. **Wayland en macOS** (rumores)
   - Apple podría introducir algo similar
   - Mejor soporte para tiling WMs

2. **Integración con Stage Manager**
   - Yabai/Aerospace trabajando junto a Stage Manager
   - Hybrid workflows

3. **AI-powered window management**
   - Plugins que predicen layout ideal
   - Auto-organización inteligente

4. **Mejores APIs de Apple**
   - Menos necesidad de deshabilitar SIP
   - Native tiling support (esperemos)

---

## 💡 Consejos Pro 2025

1. **Usa Git para tus dotfiles**
```bash
cd ~
git init
git add .yabairc .skhdrc .zshrc .config/
git commit -m "Initial dotfiles"
git remote add origin your-repo-url
git push -u origin main
```

2. **Automatiza backups de configuración**
```bash
# Crontab para backup diario
0 0 * * * tar -czf ~/Dropbox/dotfiles-backup-$(date +\%Y\%m\%d).tar.gz \
  ~/.yabairc ~/.skhdrc ~/.config/ ~/.zshrc
```

3. **Usa Homebrew Bundle**
```bash
brew bundle dump --file=~/Brewfile
# Commit tu Brewfile al repo
```

4. **Testea configs antes de aplicar**
```bash
# Test yabai config
yabai --check ~/.yabairc

# Test skhd config
skhd --check ~/.skhdrc
```

---

## 🎓 Conclusión

El setup Arch-like en macOS ha madurado significativamente en 2025. Las herramientas son más estables, hay más opciones, y la comunidad está más activa que nunca.

**Recomendación final**: Empieza simple, agrega complejidad gradualmente, y personaliza según tus necesidades específicas.

---

**Actualizado**: Noviembre 2025
**Próxima revisión**: Marzo 2026
