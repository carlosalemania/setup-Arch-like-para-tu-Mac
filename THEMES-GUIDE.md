# 🎨 Guía Completa de Temas - Setup Arch-like macOS

**Personalización épica con temas neón, bordes personalizados y gradientes vibrantes**

---

## 📋 Índice

- [🔥 Bordes de Ventana (JankyBorders)](#-bordes-de-ventana-jankyborders)
- [🖥️ Temas Warp Terminal](#️-temas-warp-terminal)
- [📊 Temas btop](#-temas-btop)
- [🎨 Paleta de Colores](#-paleta-de-colores)
- [⚙️ Instalación](#️-instalación)
- [🔧 Personalización](#-personalización)

---

## 🔥 Bordes de Ventana (JankyBorders)

### Instalación

```bash
# Instalar JankyBorders
brew tap FelixKratz/formulae
brew install borders

# Copiar configuración
mkdir -p ~/.config/borders
cp configs/borders/bordersrc ~/.config/borders/
chmod +x ~/.config/borders/bordersrc

# Iniciar servicio
brew services start borders
```

### Configuración Actual

- **Color activo**: Rosa neón `#ff0080` (0xffff0080)
- **Color inactivo**: Gris oscuro `#808080` con 25% opacidad (0x40808080)
- **Grosor**: 6 píxeles
- **Estilo**: Redondeado con blur
- **Radius**: 12px de curvatura

### Personalizar Colores

Edita `~/.config/borders/bordersrc`:

```bash
# Rosa neón profundo (actual)
active_color=0xffff0080

# Deep Pink ultra vibrante
active_color=0xffff1493

# Cyan neón
active_color=0xff00ffff

# Magenta puro
active_color=0xffff00ff

# Naranja fuego
active_color=0xffff6600

# Morado neón
active_color=0xffaa00ff

# Verde Matrix
active_color=0xff00ff41
```

**Reinicia el servicio:**
```bash
brew services restart borders
```

### Ajustar Grosor y Blur

```bash
# Grosor (en píxeles)
width=6.0    # Cambiar a 4.0, 8.0, 10.0, etc.

# Blur radius
blur_radius=8.0    # Cambiar a 4.0, 12.0, 16.0, etc.
```

---

## 🖥️ Temas Warp Terminal

### Instalación

```bash
# Copiar temas
mkdir -p ~/.warp/themes
cp configs/warp-themes/*.yaml ~/.warp/themes/

# Reiniciar Warp Terminal
```

### Activar Tema

1. Abre Warp Terminal
2. Presiona `Cmd + ,` (Settings)
3. Ve a **Appearance** → **Current Theme**
4. Selecciona:
   - `neon-fire-tokyo`
   - `cyberpunk-fire`

### Temas Disponibles

#### 1. 🔥 Neon Fire Tokyo
**Elegante pero vibrante**

- **Acento**: Rosa neón `#ff0080`
- **Fondo**: Negro profundo `#0a0e14`
- **Cursor**: Magenta neón `#ff00ff`
- **Uso**: Trabajo diario con estilo

**Paleta:**
```
Rosa fuego:    #ff0055
Cyan vibrante: #00ff99
Naranja:       #ffaa00
Azul:          #0099ff
Magenta:       #ff00ff
```

#### 2. ⚡ Cyberpunk Fire
**Ultra vibrante, máximo neón**

- **Acento**: Deep Pink `#ff1493`
- **Fondo**: Negro absoluto `#000000`
- **Cursor**: Magenta puro `#ff00ff`
- **Uso**: Screenshots, streaming, máximo impacto

**Paleta:**
```
Deep Pink:     #ff1493
Cyan neón:     #00ffff
Naranja fuego: #ff6600
Azul eléctrico:#00aaff
Magenta rosa:  #ff00dd
```

### Personalizar Temas Warp

Los temas están en `~/.warp/themes/*.yaml`

```yaml
# Cambiar color de acento
accent: "#ff0080"

# Cambiar fondo
background: "#0a0e14"

# Cambiar cursor
cursor: "#ff00ff"

# Bordes (si soportado en futuras versiones)
border: "#ff0080"
```

---

## 📊 Temas btop

### Instalación Rápida

```bash
# Copiar configuración y temas
mkdir -p ~/.config/btop/themes
cp configs/btop/btop.conf ~/.config/btop/
cp configs/btop/themes/* ~/.config/btop/themes/

# Instalar scripts (opcional)
cp configs/btop/scripts/*.sh ~/
chmod +x ~/*.sh
```

### Usar el Cambiador de Temas

```bash
# Si copiaste los scripts
~/btop-theme-switcher.sh

# O usa el alias
btop-theme
```

### Temas Incluidos

#### 1. 🧛 Dracula Premium
**Oscuro vibrante - Trabajo diario**

- **Fondo**: Negro profundo `#282a36`
- **CPU**: Magenta → Púrpura → Cyan
- **MEM**: Azul eléctrico → Púrpura
- **Network**: Verde Matrix / Rojo-Naranja fuego

**Cuándo usar**: Sesiones largas, coding nocturno, uso diario

#### 2. 🌈 Cyberpunk Neon
**Ultra brillante - Máximo impacto**

- **Fondo**: Negro absoluto `#0a0e14`
- **CPU**: Magenta neón puro
- **MEM**: Azul eléctrico intenso
- **Network**: Verde Matrix / Rojo fuego

**Cuándo usar**: Screenshots, streaming, impresionar

#### 3. 🌃 Tokyo Night Storm
**Elegante profesional**

- **Fondo**: Azul noche `#24283b`
- **CPU**: Púrpura → Azul cielo
- **MEM**: Azul profundo suave
- **Network**: Verde esmeralda / Naranja suave

**Cuándo usar**: Trabajo profesional, presentaciones

#### 4. 💚 Matrix Hacker
**100% The Matrix**

- **Fondo**: Negro total `#000000`
- **Todo**: Verde Matrix `#00ff41`
- **Acentos**: Cyan brillante

**Cuándo usar**: Diversión, sentirse como Neo

### Cambiar Tema en btop

**Método 1: Dentro de btop**
```
1. Abre btop
2. Presiona 't'
3. Navega con flechas
4. Enter para aplicar
```

**Método 2: Editar config**
```bash
# Edita ~/.config/btop/btop.conf
color_theme = "cyberpunk-neon"

# Opciones:
# - dracula-premium
# - cyberpunk-neon
# - tokyo-night-storm
# - matrix-hacker
```

### Atajos de btop

| Tecla | Acción |
|-------|--------|
| `t` | Cambiar tema |
| `ESC` / `M` | Menú |
| `+` / `-` | Velocidad actualización |
| `f` | Filtrar procesos |
| `k` | Kill proceso |
| `q` | Salir |

---

## 🎨 Paleta de Colores

### Paleta Principal del Setup

```
ROSAS NEÓN:
#ff0080    Rosa neón profundo (borders, warp accent)
#ff1493    Deep Pink vibrante (warp cyberpunk)
#ff0055    Rosa fuego (warp neon-fire)
#ff00ff    Magenta neón puro (cursores)

CYANS:
#00ffff    Cyan neón brillante (borders secundario)
#00ffcc    Cyan verdoso
#00ff99    Verde cyan vibrante

NARANJAS FUEGO:
#ff6600    Naranja fuego vibrante
#ffaa00    Naranja medio
#ff8800    Naranja puro

AZULES:
#0099ff    Azul eléctrico
#00aaff    Azul brillante
#0088ff    Azul medio

MORADOS:
#bd93f9    Púrpura Dracula
#aa00ff    Morado neón
#8800ff    Púrpura oscuro

VERDES:
#00ff41    Verde Matrix
#00ff88    Verde cyan
#50fa7b    Verde Dracula

FONDOS:
#000000    Negro absoluto
#0a0e14    Negro profundo
#282a36    Negro Dracula
#24283b    Azul noche Tokyo
```

### Conversión de Colores

**Formato hexadecimal → ARGB (para borders):**

```
#ff0080 → 0xffff0080
│ │└─────────── Color RGB
│ └──────────── Formato hex
└────────────── 0x prefix

Opacidad:
0xff = 100% (opaco)
0x80 = 50%
0x40 = 25%
0x00 = 0% (transparente)

Ejemplo con transparencia:
#ff0080 semi-transparente = 0x80ff0080
```

---

## ⚙️ Instalación Completa

### Script de Instalación Automática

```bash
#!/bin/bash

echo "🎨 Instalando temas épicos..."

# Borders
brew tap FelixKratz/formulae 2>/dev/null
brew install borders
mkdir -p ~/.config/borders
cp configs/borders/bordersrc ~/.config/borders/
chmod +x ~/.config/borders/bordersrc
brew services start borders

# Warp themes
mkdir -p ~/.warp/themes
cp configs/warp-themes/*.yaml ~/.warp/themes/

# btop
mkdir -p ~/.config/btop/themes
cp configs/btop/btop.conf ~/.config/btop/
cp configs/btop/themes/* ~/.config/btop/themes/

# Scripts
cp configs/btop/scripts/*.sh ~/
chmod +x ~/*-theme*.sh

echo "✅ Instalación completada!"
echo ""
echo "📋 Próximos pasos:"
echo "1. Reinicia Warp Terminal"
echo "2. Abre Warp Settings → Appearance → Themes"
echo "3. Ejecuta 'btop' y presiona 't' para cambiar tema"
echo "4. Los bordes rosa neón ya deberían estar activos"
```

Guarda como `install-themes.sh` y ejecuta:
```bash
chmod +x install-themes.sh
./install-themes.sh
```

---

## 🔧 Personalización Avanzada

### Crear tu Propio Tema de btop

```bash
# 1. Copia un tema base
cp ~/.config/btop/themes/dracula-premium.theme ~/.config/btop/themes/mi-tema.theme

# 2. Edita los colores
nvim ~/.config/btop/themes/mi-tema.theme

# 3. Aplica tu tema
# En btop.conf:
color_theme = "mi-tema"
```

### Colores Principales en btop

```conf
theme[main_bg]        # Fondo principal
theme[main_fg]        # Texto principal
theme[title]          # Títulos

# Cajas
theme[cpu_box]        # Borde CPU
theme[mem_box]        # Borde Memory

# Gradientes CPU
theme[cpu_start]      # Color inicial
theme[cpu_mid]        # Color medio
theme[cpu_end]        # Color final

# Memory
theme[used_start]
theme[used_mid]
theme[used_end]

# Network
theme[download_start]
theme[upload_start]
```

### Crear Tema Warp Personalizado

```yaml
# ~/.warp/themes/mi-tema.yaml

accent: "#tucolor"
background: "#fondo"
foreground: "#texto"
details: darker

terminal_colors:
  normal:
    black: "#000000"
    red: "#ff0000"
    green: "#00ff00"
    yellow: "#ffff00"
    blue: "#0000ff"
    magenta: "#ff00ff"
    cyan: "#00ffff"
    white: "#ffffff"

  bright:
    black: "#808080"
    red: "#ff8080"
    green: "#80ff80"
    yellow: "#ffff80"
    blue: "#8080ff"
    magenta: "#ff80ff"
    cyan: "#80ffff"
    white: "#ffffff"
```

---

## 🐛 Troubleshooting

### Borders no aparecen

```bash
# Verificar servicio
brew services list | grep borders

# Reiniciar
brew services restart borders

# Ver logs
tail -f /tmp/borders_*.log
```

### Temas Warp no se ven

```bash
# Verificar archivos
ls ~/.warp/themes/

# Reiniciar Warp completamente
# Cmd + Q, luego reabrir
```

### btop no muestra temas

```bash
# Verificar temas instalados
ls ~/.config/btop/themes/

# Permisos
chmod 644 ~/.config/btop/themes/*

# Reinstalar
cp configs/btop/themes/* ~/.config/btop/themes/
```

---

## 📸 Screenshots

*(Agrega capturas de pantalla de cada tema aquí)*

---

## 💡 Tips Pro

### Combinaciones Recomendadas

| Situación | Borders | Warp | btop |
|-----------|---------|------|------|
| **Trabajo diario** | Rosa `#ff0080` | Neon Fire Tokyo | Dracula Premium |
| **Streaming** | Deep Pink `#ff1493` | Cyberpunk Fire | Cyberpunk Neon |
| **Profesional** | Cyan `#00ffff` | Neon Fire Tokyo | Tokyo Night Storm |
| **Diversión** | Verde `#00ff41` | Cyberpunk Fire | Matrix Hacker |

### Cambiar Todo al Mismo Tiempo

```bash
# Script para cambiar todo a modo Cyberpunk
#!/bin/bash

# Borders
sed -i '' 's/active_color=.*/active_color=0xffff1493/' ~/.config/borders/bordersrc
brew services restart borders

# btop
sed -i '' 's/color_theme = .*/color_theme = "cyberpunk-neon"/' ~/.config/btop/btop.conf

echo "✅ Modo Cyberpunk activado!"
```

---

## 🌈 Galería de Colores

Prueba estos colores en tus bordes:

```bash
# Rosas
0xffff0080  # Rosa neón profundo ⭐
0xffff1493  # Deep Pink vibrante
0xffff69b4  # Rosa pastel

# Cyans
0xff00ffff  # Cyan neón ⭐
0xff00ffcc  # Cyan verdoso
0xff00e5ff  # Cyan cielo

# Morados
0xffaa00ff  # Morado neón ⭐
0xff8800ff  # Púrpura oscuro
0xffbd93f9  # Púrpura Dracula

# Verdes
0xff00ff41  # Verde Matrix ⭐
0xff00ff88  # Verde cyan
0xff50fa7b  # Verde Dracula

# Naranjas
0xffff6600  # Naranja fuego ⭐
0xffff8800  # Naranja puro
0xffffaa00  # Naranja medio
```

---

## 📚 Recursos Adicionales

- [JankyBorders GitHub](https://github.com/FelixKratz/JankyBorders)
- [btop GitHub](https://github.com/aristocratos/btop)
- [Warp Terminal](https://www.warp.dev/)
- [Color Picker Online](https://htmlcolorcodes.com/)

---

## ❤️ Créditos

**Temas creados por Carlos Alemania**

Inspirado en:
- Dracula Theme
- Tokyo Night
- Cyberpunk aesthetics
- The Matrix
- r/unixporn

---

**¿Preguntas o nuevas ideas de temas?**

Abre un issue: https://github.com/carlosalemania/setup-Arch-like-para-tu-Mac/issues

---

<div align="center">

**🎨 ¡Disfruta tus temas épicos! 🎨**

*Personaliza, experimenta, y comparte tus creaciones*

</div>
