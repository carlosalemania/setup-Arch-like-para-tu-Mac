# ⚡ GUÍA RÁPIDA - BTOP TEMAS ÉPICOS

## 🚀 Instalación en 30 segundos

```bash
cd ~/btop-themes-custom
./install-themes.sh
source ~/.zshrc  # o ~/.bashrc si usas bash
```

## 🎨 Cambiar tema

```bash
btop-theme
```

## 🎯 Temas Disponibles

| # | Tema | Descripción | Cuándo usar |
|---|------|-------------|-------------|
| 1 | **Dracula Premium** | Oscuro vibrante neón | Trabajo diario/nocturno |
| 2 | **Cyberpunk Neon** | Ultra brillante | Screenshots/streaming |
| 3 | **Tokyo Night Storm** | Azules elegantes | Trabajo profesional |
| 4 | **Matrix Hacker** | Verde Matrix | Diversión/estilo |

## ⌨️ Atajos btop

| Tecla | Acción |
|-------|--------|
| `t` | Cambiar tema (dentro de btop) |
| `ESC` o `M` | Menú |
| `+` / `-` | Ajustar velocidad actualización |
| `f` | Filtrar procesos |
| `k` | Kill proceso |
| `q` | Salir |

## 🎨 Especificaciones de Temas

### Dracula Premium (Tema Principal)
```
✨ CPU:  Magenta → Púrpura → Cyan (neón)
💾 MEM:  Azul eléctrico → Púrpura profundo
🔄 SWAP: Cyan neón vibrante
📥 RX:   Verde Matrix suave
📤 TX:   Rojo → Naranja fuego
```

### Cyberpunk Neon (Ultra Vibrante)
```
✨ CPU:  Light Magenta puro
💾 MEM:  Azul eléctrico
🔄 SWAP: Cyan neón
📥 RX:   Verde Matrix brillante
📤 TX:   Rojo fuego intenso
```

### Tokyo Night Storm (Elegante)
```
✨ CPU:  Púrpura → Azul cielo
💾 MEM:  Azul profundo
🔄 SWAP: Verde esmeralda
📥 RX:   Verde suave
📤 TX:   Naranja suave
```

### Matrix Hacker (100% Matrix)
```
✨ TODO: Verde Matrix (#00ff41)
💚 Acentos: Cyan brillante
🎬 Estilo: The Matrix
```

## 🔧 Troubleshooting Rápido

**Temas no aparecen:**
```bash
ls ~/.config/btop/themes/  # Verificar archivos
```

**Permission denied:**
```bash
sudo chown -R $USER:staff ~/.config/btop
```

**Cambios no se aplican:**
1. Cierra btop completamente
2. Reinicia btop
3. Presiona `t` para cambiar tema

## 💡 Tips Rápidos

### Cambiar tema sin salir de btop
Presiona `t` → Flechas → Enter

### Ejecutar btop con tema específico
```bash
# Edita ~/.config/btop/btop.conf
color_theme = "cyberpunk-neon"
```

### Ver todos los archivos
```bash
ls ~/btop-themes-custom/
```

## 📁 Estructura

```
~/btop-themes-custom/
├── 📘 README.md              → Documentación completa
├── ⚡ QUICK-START.md         → Esta guía
├── 🚀 install-themes.sh      → Instalador
├── 🎨 btop-theme-switcher.sh → Cambiador de temas
├── ⚙️  btop.conf              → Config optimizada
└── 🎨 *.theme                → 4 temas épicos
```

## 🎯 Recomendaciones

| Situación | Tema Recomendado |
|-----------|------------------|
| Coding nocturno | Dracula Premium |
| Streaming | Cyberpunk Neon |
| Trabajo | Tokyo Night Storm |
| Diversión | Matrix Hacker |
| Screenshot | Cyberpunk Neon |
| Uso diario | Dracula Premium |

## 🌈 Cambiar según mood

**Productivo**: Tokyo Night Storm
**Creativo**: Dracula Premium
**Energético**: Cyberpunk Neon
**Nostálgico**: Matrix Hacker

---

**🚀 ¡Listo! Ya tienes todo configurado.**

Para más detalles, lee el `README.md` completo.

**¿Primer uso?**
```bash
btop-theme  # Abre el menú
# Selecciona 1 (Dracula Premium)
# Abre btop
# ¡Disfruta! 🎉
```
