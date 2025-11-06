# 📁 Configuraciones - Setup Arch-like macOS

Archivos de configuración para temas neón, bordes personalizados y herramientas de monitoreo.

---

## 📂 Estructura

```
configs/
├── borders/
│   └── bordersrc              # Configuración JankyBorders (rosa neón)
├── yabai/
│   └── yabairc                # Configuración Yabai window manager
├── btop/
│   ├── btop.conf              # Configuración principal btop
│   ├── themes/                # 4 temas épicos
│   │   ├── dracula-premium.theme
│   │   ├── cyberpunk-neon.theme
│   │   ├── tokyo-night-storm.theme
│   │   └── matrix-hacker.theme
│   ├── scripts/               # Scripts de instalación
│   │   ├── install-themes.sh
│   │   ├── btop-theme-switcher.sh
│   │   └── fix-permissions.sh
│   ├── README.md              # Documentación completa btop
│   ├── QUICK-START.md         # Guía rápida
│   └── TEMAS-PREVIEW.md       # Preview de temas
└── warp-themes/
    ├── neon-fire-tokyo.yaml   # Tema Warp rosa neón elegante
    └── cyberpunk-fire.yaml    # Tema Warp ultra vibrante
```

---

## 🚀 Instalación Rápida

### Todo en uno

```bash
# Ejecutar desde el directorio raíz del repositorio
./install-all-configs.sh
```

### Manual (paso a paso)

#### 1. Borders (Bordes Rosa Neón)

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

#### 2. Yabai (Window Manager)

```bash
# Ya deberías tener yabai instalado
# Copiar configuración actualizada
cp configs/yabai/yabairc ~/.config/yabai/
chmod +x ~/.config/yabai/yabairc

# Reiniciar yabai
yabai --restart-service
```

#### 3. btop (Monitor del Sistema)

```bash
# Instalar btop si no lo tienes
brew install btop

# Copiar configuración y temas
mkdir -p ~/.config/btop/themes
cp configs/btop/btop.conf ~/.config/btop/
cp configs/btop/themes/* ~/.config/btop/themes/

# Copiar scripts (opcional)
cp configs/btop/scripts/*.sh ~/
chmod +x ~/*.sh

# Añadir alias (opcional)
echo 'alias btop-theme="~/btop-theme-switcher.sh"' >> ~/.zshrc
source ~/.zshrc
```

#### 4. Warp Terminal (Temas Neón)

```bash
# Copiar temas
mkdir -p ~/.warp/themes
cp configs/warp-themes/*.yaml ~/.warp/themes/

# Reiniciar Warp Terminal
# Luego: Cmd+, → Appearance → Themes → Seleccionar tema
```

---

## 🎨 Colores y Paletas

### Borders
- **Rosa neón**: `#ff0080` (0xffff0080)
- **Deep Pink**: `#ff1493` (0xffff1493)
- **Cyan neón**: `#00ffff` (0xff00ffff)

### Warp Themes

**Neon Fire Tokyo:**
- Acento: `#ff0080`
- Fondo: `#0a0e14`
- Cursor: `#ff00ff`

**Cyberpunk Fire:**
- Acento: `#ff1493`
- Fondo: `#000000`
- Cursor: `#ff00ff`

### btop Themes

| Tema | Colores Principales |
|------|---------------------|
| **Dracula Premium** | Magenta, Púrpura, Cyan |
| **Cyberpunk Neon** | Magenta neón, Azul eléctrico, Verde Matrix |
| **Tokyo Night Storm** | Púrpura, Azul, Verde esmeralda |
| **Matrix Hacker** | Verde Matrix (#00ff41) |

---

## ⚙️ Configuraciones Incluidas

### bordersrc

Configuración de JankyBorders con:
- Bordes rosa neón de 6px
- Esquinas redondeadas (radius 12px)
- Blur suave (8.0)
- Detección automática de ventana activa

**Personalizar:**
```bash
# Cambiar color
active_color=0xffff1493  # Deep Pink

# Cambiar grosor
width=8.0

# Cambiar blur
blur_radius=12.0
```

### yabairc

Configuración optimizada de yabai:
- Layout BSP
- Padding 12px
- Mouse modifier: Alt
- Reglas para apps flotantes

### btop.conf

Configuración optimizada:
- Gráficos Braille (alta resolución)
- Gradientes activados
- Update cada 1 segundo
- GPU support
- Tema por defecto: cyberpunk-neon

**Cambiar tema:**
```bash
# Editar btop.conf
color_theme = "dracula-premium"
# Opciones: dracula-premium, cyberpunk-neon, tokyo-night-storm, matrix-hacker
```

---

## 🔧 Personalización

### Crear Tu Propio Tema btop

```bash
# 1. Copiar tema base
cp ~/.config/btop/themes/dracula-premium.theme ~/.config/btop/themes/mi-tema.theme

# 2. Editar colores
nano ~/.config/btop/themes/mi-tema.theme

# 3. Aplicar
# En btop.conf: color_theme = "mi-tema"
```

### Crear Tema Warp Personalizado

```bash
# 1. Copiar tema base
cp ~/.warp/themes/neon-fire-tokyo.yaml ~/.warp/themes/mi-tema.yaml

# 2. Editar colores
nano ~/.warp/themes/mi-tema.yaml

# 3. Reiniciar Warp y seleccionar en Settings
```

### Cambiar Color de Borders

```bash
# Editar bordersrc
nano ~/.config/borders/bordersrc

# Cambiar active_color a tu color favorito
# Formato: 0xAARRGGBB
# AA = opacidad (ff = opaco)
# RRGGBB = color hex

# Reiniciar
brew services restart borders
```

---

## 🐛 Troubleshooting

### Borders no aparecen

```bash
# Verificar servicio
brew services list | grep borders

# Ver si está corriendo
ps aux | grep borders

# Reiniciar
brew services restart borders

# Verificar permisos de Accesibilidad
# System Settings → Privacy & Security → Accessibility
```

### Temas btop no cargan

```bash
# Verificar archivos
ls ~/.config/btop/themes/

# Permisos
chmod 644 ~/.config/btop/themes/*

# Verificar sintaxis del tema
cat ~/.config/btop/themes/cyberpunk-neon.theme | head -20
```

### Warp no muestra temas

```bash
# Verificar archivos
ls ~/.warp/themes/

# Reiniciar Warp completamente (Cmd+Q)
# Verificar formato YAML correcto
```

---

## 📚 Documentación Completa

Para guías detalladas, consulta:

- **[THEMES-GUIDE.md](../THEMES-GUIDE.md)** - Guía completa de temas
- **[btop/README.md](btop/README.md)** - Documentación btop
- **[btop/QUICK-START.md](btop/QUICK-START.md)** - Inicio rápido btop

---

## 🔄 Actualizar Configuraciones

Si actualizas el repositorio:

```bash
# Pull últimos cambios
git pull origin main

# Recopiar configs actualizadas
cp configs/borders/bordersrc ~/.config/borders/
cp configs/btop/btop.conf ~/.config/btop/
cp configs/btop/themes/* ~/.config/btop/themes/
cp configs/warp-themes/*.yaml ~/.warp/themes/

# Reiniciar servicios
brew services restart borders
yabai --restart-service
```

---

## 💡 Tips

### Cambiar Todo el Setup de Color

```bash
# Script para cambiar a modo Cyberpunk completo
#!/bin/bash

# Borders → Deep Pink
sed -i '' 's/active_color=.*/active_color=0xffff1493/' ~/.config/borders/bordersrc
brew services restart borders

# btop → Cyberpunk Neon
sed -i '' 's/color_theme = .*/color_theme = "cyberpunk-neon"/' ~/.config/btop/btop.conf

# Mensaje
echo "✅ Modo Cyberpunk activado!"
echo "🎨 Cambia Warp a: Cyberpunk Fire (Settings)"
```

### Aliases Útiles

Agrega a `~/.zshrc`:

```bash
# Cambiar temas rápidamente
alias theme-cyber='sed -i "" "s/color_theme = .*/color_theme = \"cyberpunk-neon\"/" ~/.config/btop/btop.conf'
alias theme-dracula='sed -i "" "s/color_theme = .*/color_theme = \"dracula-premium\"/" ~/.config/btop/btop.conf'
alias theme-tokyo='sed -i "" "s/color_theme = .*/color_theme = \"tokyo-night-storm\"/" ~/.config/btop/btop.conf'
alias theme-matrix='sed -i "" "s/color_theme = .*/color_theme = \"matrix-hacker\"/" ~/.config/btop/btop.conf'

# Borders
alias borders-restart='brew services restart borders'
alias borders-stop='brew services stop borders'
alias borders-start='brew services start borders'
```

---

## ❤️ Contribuir

¿Creaste un tema épico? ¡Compártelo!

1. Fork el repositorio
2. Agrega tu tema en `configs/btop/themes/` o `configs/warp-themes/`
3. Actualiza esta documentación
4. Envía un Pull Request

---

**🎨 Configuraciones creadas con amor (y muchos neones) por Carlos Alemania**

*Para más información: [README principal](../README.md)*
