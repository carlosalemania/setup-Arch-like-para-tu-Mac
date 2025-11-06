# 🎨 BTOP TEMAS ÉPICOS

Colección de temas personalizados ultra vibrantes para btop con gradientes neón, colores profundos y efectos visuales espectaculares.

## 🌟 Temas Incluidos

### 1. 🧛 Dracula Premium
**El tema principal - Oscuro y vibrante**

- **Fondo**: Negro profundo (#282a36)
- **CPU**: Degradado magenta → púrpura → cyan neón
- **MEM**: Azul eléctrico → púrpura profundo
- **SWAP**: Cyan neón vibrante
- **Network RX**: Verde Matrix suave
- **Network TX**: Rojo → naranja fuego
- **Bordes**: Púrpura/Cyan/Verde según la caja
- **Texto**: Blanco puro con acentos rosa neón

**Perfecto para**: Sesiones nocturnas, trabajo prolongado, ambiente profesional pero stylish

---

### 2. 🌈 Cyberpunk Neon
**Ultra brillante - Modo hacker extremo**

- **Fondo**: Negro absoluto (#0a0e14)
- **CPU**: Light magenta neón puro
- **MEM**: Azul eléctrico intenso
- **SWAP**: Cyan neón brillante
- **Network RX**: Verde neón (Matrix)
- **Network TX**: Rojo fuego intenso
- **Bordes**: Magenta/Azul/Verde según especificaciones
- **Texto**: Blanco puro sobre negro

**Perfecto para**: Impresionar, streaming, capturas de pantalla épicas

---

### 3. 🌃 Tokyo Night Storm
**Elegante y moderno - Azules profundos**

- **Fondo**: Azul noche (#24283b)
- **CPU**: Púrpura → azul cielo
- **MEM**: Azul profundo suave
- **Network**: Verde esmeralda / Naranja suave
- **Bordes**: Azul medio elegante
- **Texto**: Gris azulado claro

**Perfecto para**: Trabajo profesional, presentaciones, uso diario elegante

---

### 4. 💚 Matrix Hacker (BONUS)
**Verde Matrix puro - Modo Neo**

- **Fondo**: Negro total (#000000)
- **TODO**: Verde Matrix (#00ff41)
- **Acentos**: Cyan brillante
- **Network**: Verde/Amarillo Matrix
- **Estilo**: 100% The Matrix

**Perfecto para**: Sentirte en The Matrix, modo hacker puro

---

## 🚀 Instalación Rápida

### Opción 1: Script automático (RECOMENDADO)

```bash
cd ~/btop-themes-custom
./install-themes.sh
```

Esto instalará:
- ✅ Todos los temas en `~/.config/btop/themes/`
- ✅ Configuración base optimizada
- ✅ Alias `btop-theme` para cambiar temas
- ✅ Permisos corregidos automáticamente

### Opción 2: Manual

```bash
# Arreglar permisos si es necesario
sudo chown -R $USER:staff ~/.config

# Crear directorios
mkdir -p ~/.config/btop/themes

# Copiar temas
cp ~/btop-themes-custom/*.theme ~/.config/btop/themes/

# Copiar configuración (si no existe)
cp ~/btop-themes-custom/btop.conf ~/.config/btop/
```

---

## 🎮 Uso

### Cambiar tema interactivamente

```bash
btop-theme
```

Esto abrirá un menú interactivo donde puedes:
- Ver todos los temas disponibles
- Leer descripciones de cada tema
- Aplicar el tema con un solo número
- Ver preview de colores

### Cambiar tema manualmente

1. Abre btop
2. Presiona `ESC` o `M` para el menú
3. Ve a "Options"
4. Selecciona "Color theme"
5. Elige tu tema favorito

### Cambiar tema desde config

Edita `~/.config/btop/btop.conf` y cambia la línea:

```conf
color_theme = "dracula-premium"
```

Opciones disponibles:
- `dracula-premium`
- `cyberpunk-neon`
- `tokyo-night-storm`
- `matrix-hacker`

---

## ⚙️ Características Especiales

### Gradientes Personalizados
Todos los temas usan gradientes suaves y personalizados para:
- CPU usage
- Memory usage
- Network activity
- Process activity

### Caracteres Especiales
La configuración usa **caracteres Braille** para gráficos ultra detallados:
```conf
graph_symbol = "braille"
```

Esto proporciona resolución 8x más alta que bloques normales.

### Esquinas Redondeadas
```conf
rounded_corners = True
```

Interfaz moderna con bordes suavizados (requiere soporte del terminal).

### GPU Support
```conf
enable_gpu = True
```

Monitoreo de GPU habilitado si está disponible.

---

## 🎨 Personalización

### Crear tu propio tema

1. Copia un tema base:
```bash
cp ~/.config/btop/themes/dracula-premium.theme ~/.config/btop/themes/mi-tema.theme
```

2. Edita los colores (formato hexadecimal):
```conf
theme[cpu_start]="#ff00ff"  # Color inicial
theme[cpu_mid]="#00ffff"    # Color medio
theme[cpu_end]="#00ff00"    # Color final
```

3. Activa tu tema:
```bash
btop-theme
# O edita btop.conf manualmente
```

### Colores principales que puedes modificar

```conf
theme[main_bg]        # Fondo principal
theme[main_fg]        # Texto principal
theme[title]          # Títulos de cajas
theme[hi_fg]          # Highlights
theme[selected_bg]    # Fondo seleccionado
theme[selected_fg]    # Texto seleccionado

# Cajas
theme[cpu_box]        # Borde CPU
theme[mem_box]        # Borde Memory
theme[net_box]        # Borde Network
theme[proc_box]       # Borde Processes

# Gradientes CPU
theme[cpu_start]
theme[cpu_mid]
theme[cpu_end]

# Gradientes Memory
theme[free_start/mid/end]
theme[cached_start/mid/end]
theme[available_start/mid/end]
theme[used_start/mid/end]

# Network
theme[download_start/mid/end]  # RX
theme[upload_start/mid/end]    # TX
```

---

## 🔧 Troubleshooting

### Los temas no aparecen
```bash
# Verifica que los archivos estén en el lugar correcto
ls ~/.config/btop/themes/

# Debe mostrar:
# cyberpunk-neon.theme
# dracula-premium.theme
# matrix-hacker.theme
# tokyo-night-storm.theme
```

### Permission denied en .config
```bash
sudo chown -R $USER:staff ~/.config/btop
```

### Los colores no se ven bien
Asegúrate de que tu terminal soporte:
- True color (24-bit)
- UTF-8
- Caracteres Unicode

Terminales recomendados:
- iTerm2 (macOS)
- Alacritty
- Kitty
- WezTerm

### Cambios no se aplican
1. Cierra btop completamente
2. Verifica que el tema esté en `~/.config/btop/themes/`
3. Verifica que `btop.conf` tenga el nombre correcto
4. Reinicia btop

---

## 📊 Comparación de Temas

| Tema | Brillo | Contraste | Uso | Mood |
|------|--------|-----------|-----|------|
| **Dracula Premium** | ⭐⭐⭐ | ⭐⭐⭐⭐ | Diario | Profesional cool |
| **Cyberpunk Neon** | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | Demostraciones | Hacker extremo |
| **Tokyo Night Storm** | ⭐⭐ | ⭐⭐⭐ | Trabajo | Elegante |
| **Matrix Hacker** | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | Diversión | Neo mode |

---

## 🎯 Recomendaciones de Uso

### Para trabajo diario
1. **Tokyo Night Storm** - Suave y profesional
2. **Dracula Premium** - Balance perfecto

### Para screenshots/streaming
1. **Cyberpunk Neon** - Máximo impacto visual
2. **Matrix Hacker** - Estilo único

### Para coding nocturno
1. **Dracula Premium** - Optimizado para largas sesiones
2. **Tokyo Night Storm** - Menos fatiga visual

### Para impresionar
1. **Cyberpunk Neon** - WOW factor
2. **Matrix Hacker** - Icónico

---

## 📝 Configuración Optimizada

El archivo `btop.conf` incluye optimizaciones:

- ⚡ Update cada 1 segundo (balance performance/info)
- 🎨 Gradientes habilitados
- 📊 Gráficos Braille (máxima resolución)
- 🌡️ Monitoreo de temperatura
- 🔋 Monitoreo de batería
- 💾 Estadísticas de disco
- 🌐 Estadísticas de red
- 🖥️ GPU support
- ⌚ Reloj en formato 24h
- 🎯 Process tree depth = 3

---

## 🚀 Tips Pro

1. **Atajos de teclado en btop**:
   - `ESC/M` - Menú
   - `t` - Cambiar tema rápidamente
   - `+/-` - Cambiar intervalo de actualización
   - `f` - Filtrar procesos
   - `k` - Kill proceso

2. **Cambiar tema sin reiniciar btop**:
   - Presiona `t` dentro de btop
   - Navega con flechas
   - Enter para aplicar

3. **Crear alias personalizados**:
```bash
# En tu .zshrc o .bashrc
alias btop-cyber='btop --theme cyberpunk-neon'
alias btop-dracula='btop --theme dracula-premium'
alias btop-matrix='btop --theme matrix-hacker'
```

---

## 🎬 Scripts Incluidos

### `install-themes.sh`
Instalador automático completo

### `btop-theme-switcher.sh`
Cambiador interactivo de temas con preview

---

## 📦 Archivos del Proyecto

```
~/btop-themes-custom/
├── README.md                      # Este archivo
├── install-themes.sh              # Instalador
├── btop-theme-switcher.sh         # Cambiador de temas
├── btop.conf                      # Configuración optimizada
├── dracula-premium.theme          # Tema Dracula
├── cyberpunk-neon.theme           # Tema Cyberpunk
├── tokyo-night-storm.theme        # Tema Tokyo Night
└── matrix-hacker.theme            # Tema Matrix
```

---

## 🎨 Paletas de Colores

### Dracula Premium
```
Background:  #282a36  Púrpura:  #bd93f9
Foreground:  #f8f8f2  Rosa:     #ff79c6
Cyan:        #8be9fd  Verde:    #50fa7b
Naranja:     #ffb86c  Rojo:     #ff5555
Amarillo:    #f1fa8c  Gris:     #6272a4
```

### Cyberpunk Neon
```
Background:  #0a0e14  Magenta:  #ff00ff
Foreground:  #ffffff  Cyan:     #00ffff
Azul:        #0080ff  Verde:    #00ff00
Naranja:     #ff8800  Rojo:     #ff0000
Púrpura:     #8800ff  Gris:     #5c6370
```

---

## 📸 Screenshots

Para ver tus temas en acción:

```bash
btop
```

Presiona `t` para ciclar entre temas y encontrar tu favorito.

---

## ❤️ Créditos

Temas creados con amor y muchos neones por Carlos Alemania

Inspirado en:
- Dracula Theme
- Tokyo Night
- Cyberpunk aesthetics
- The Matrix

---

## 📄 Licencia

Libre para usar y modificar. ¡Comparte tus creaciones!

---

**¿Preguntas? ¿Bugs? ¿Ideas para nuevos temas?**

¡Disfruta tus temas épicos! 🚀✨
