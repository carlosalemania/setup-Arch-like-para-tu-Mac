# 📑 Índice Completo - Setup Arch-like macOS 2025

## 🎯 Guía de Lectura Rápida

**¿Qué necesitas ahora?**

- 🚨 **Tengo un error de conexión a GitHub** → [SOLUCION-RAPIDA.md](SOLUCION-RAPIDA.md)
- 🆕 **Quiero empezar desde cero** → [README-SETUP.md](README-SETUP.md)
- 🔧 **Tengo un problema específico** → [TROUBLESHOOTING-2025.md](TROUBLESHOOTING-2025.md)
- 📚 **Quiero entender todo en detalle** → [arch-macos-setup-2025.md](arch-macos-setup-2025.md)
- 💼 **Comandos para ventas** → [sales-workflow-cli-guide.md](sales-workflow-cli-guide.md)
- ✨ **Ver novedades 2025** → [WHATS-NEW-2025.md](WHATS-NEW-2025.md)

---

## 📂 Estructura de Archivos

```
~/
├── README-SETUP.md                 # 🚀 Inicio rápido (EMPIEZA AQUÍ)
├── SOLUCION-RAPIDA.md             # 🚨 Solución al error actual
├── INDEX.md                        # 📑 Este archivo
│
├── Guías Completas/
│   ├── arch-macos-setup-2025.md   # 📚 Guía detallada completa
│   ├── TROUBLESHOOTING-2025.md    # 🔧 Solución de problemas
│   ├── WHATS-NEW-2025.md          # ✨ Novedades y actualizaciones
│   └── sales-workflow-cli-guide.md # 💼 Comandos CLI para ventas
│
└── Scripts/
    ├── install-arch-macos-fixed.sh    # 🛠️  Instalación completa (MEJORADO)
    ├── install-full-setup.sh          # 📦 Script original (con error)
    ├── fix-github-connection.sh       # 🔌 Corrección de conexión
    └── start-wm.sh                    # ▶️  Inicio rápido de servicios
```

---

## 📖 Descripción de Cada Archivo

### 🚀 Para Empezar

#### `README-SETUP.md` (7.4K)
**Lee esto primero si eres nuevo**
- Introducción al proyecto
- Requisitos del sistema
- Instalación rápida en 3 pasos
- Primeros atajos de teclado
- Qué hacer después de instalar

**Tiempo de lectura**: 5 minutos

---

### 🚨 Solución de Problemas

#### `SOLUCION-RAPIDA.md` (NUEVO)
**Lee esto si tienes el error de GitHub**
- Diagnóstico del problema
- 3 opciones de solución
- Pasos para continuar
- Scripts de diagnóstico
- Prevención de problemas futuros

**Tiempo de lectura**: 3 minutos
**Tiempo de solución**: 5 minutos

#### `TROUBLESHOOTING-2025.md` (NUEVO)
**Referencia completa de problemas**
- Errores de instalación
- Problemas de GitHub/Homebrew
- Yabai & Skhd no funcionan
- SketchyBar invisible
- Permisos y seguridad
- Scripts de diagnóstico
- Instalación manual de respaldo

**Tiempo de lectura**: 15 minutos
**Usar como referencia cuando necesario**

---

### 📚 Documentación Completa

#### `arch-macos-setup-2025.md` (12K)
**Guía detallada del sistema completo**
- Filosofía del proyecto
- Comparación Arch Linux vs macOS
- Instalación paso a paso explicada
- Configuración detallada de cada componente
- Personalización avanzada
- Workflow completo

**Tiempo de lectura**: 30 minutos
**Lee después de instalación básica**

#### `WHATS-NEW-2025.md` (NUEVO)
**Actualizaciones y tendencias 2025**
- Cambios importantes en comandos
- Nuevas herramientas (AeroSpace, Zellij, Atuin, etc.)
- SketchyBar mejoras
- Configuraciones recomendadas 2025
- Alternativas modernas
- Performance y optimizaciones
- Temas populares
- Tendencias futuras

**Tiempo de lectura**: 20 minutos
**Para usuarios avanzados o curiosos**

---

### 💼 Herramientas de Trabajo

#### `sales-workflow-cli-guide.md` (19K)
**Comandos CLI especializados para ventas**
- Setup de herramientas de ventas
- Análisis de datos con CLI
- Automatización de reportes
- Scripts de prospección
- Gestión de CRM desde terminal
- Dashboards en terminal
- Integraciones con APIs
- Más de 50 comandos útiles

**Tiempo de lectura**: 30 minutos
**Referencia constante para trabajo**

---

### 🛠️ Scripts de Instalación

#### `install-arch-macos-fixed.sh` (NUEVO - RECOMENDADO)
**Script de instalación mejorado**
- ✅ Manejo de errores de red
- ✅ Reintentos automáticos
- ✅ Instalación manual de respaldo
- ✅ Verificación de conectividad
- ✅ Mejor feedback visual
- ✅ Configuración automática completa

**Uso**: `./install-arch-macos-fixed.sh`

#### `install-full-setup.sh` (ORIGINAL)
**Script original - tiene el error de conexión**
- ❌ No maneja errores de red
- ⚠️ Puede fallar en tap de Homebrew
- 📦 Usa para referencia, pero prefiere el fixed

**Uso**: No recomendado ahora

#### `fix-github-connection.sh` (NUEVO)
**Script específico para error de conexión**
- Limpia DNS cache
- Configura Git correctamente
- Reintenta conexión
- Agrega taps necesarios

**Uso**: `./fix-github-connection.sh`

#### `start-wm.sh` (AUTO-GENERADO)
**Inicio rápido de servicios**
```bash
#!/bin/bash
yabai --start-service
skhd --start-service
sketchybar 2>/dev/null &
```

**Uso**: `./start-wm.sh`

---

## 🎓 Rutas de Aprendizaje

### 🌱 Principiante Absoluto

1. Lee: `README-SETUP.md` (5 min)
2. Soluciona error: `SOLUCION-RAPIDA.md` + ejecuta `fix-github-connection.sh` (8 min)
3. Instala: `./install-arch-macos-fixed.sh` (15 min)
4. Configura permisos según README (5 min)
5. Practica atajos básicos (15 min)
6. Lee cuando necesites: `TROUBLESHOOTING-2025.md`

**Tiempo total**: ~1 hora

### 🌿 Usuario Intermedio

1. Lee: `README-SETUP.md` (5 min)
2. Instala: `./install-arch-macos-fixed.sh` (15 min)
3. Lee: `arch-macos-setup-2025.md` (30 min)
4. Personaliza configs según la guía (30 min)
5. Explora: `WHATS-NEW-2025.md` para herramientas nuevas (20 min)
6. Si usas para ventas: `sales-workflow-cli-guide.md` (30 min)

**Tiempo total**: ~2-3 horas

### 🌳 Usuario Avanzado

1. Revisa: `WHATS-NEW-2025.md` para novedades (20 min)
2. Instala con customizaciones
3. Explora alternativas (AeroSpace, Zellij, etc.)
4. Configura dotfiles en Git
5. Automatiza backups
6. Contribuye a comunidad

**Tiempo total**: Proyecto continuo

---

## 🔍 Búsqueda Rápida por Tema

### Window Manager
- **Instalación básica**: README-SETUP.md
- **Configuración detallada**: arch-macos-setup-2025.md
- **Problemas**: TROUBLESHOOTING-2025.md → sección "Yabai & Skhd"
- **Alternativas 2025**: WHATS-NEW-2025.md → "Nuevas Herramientas"

### Atajos de Teclado
- **Básicos**: README-SETUP.md → "Atajos Esenciales"
- **Completos**: arch-macos-setup-2025.md → "Configuración Skhd"
- **Personalizar**: Edita `~/.skhdrc`

### Status Bar
- **SketchyBar instalación**: README-SETUP.md
- **Problemas**: TROUBLESHOOTING-2025.md → "SketchyBar"
- **Plugins nuevos 2025**: WHATS-NEW-2025.md → "SketchyBar Mejoras"

### Terminal y CLI
- **Setup básico**: README-SETUP.md
- **Configuración Alacritty**: arch-macos-setup-2025.md
- **Alternativas 2025**: WHATS-NEW-2025.md → "WezTerm"
- **Herramientas para ventas**: sales-workflow-cli-guide.md

### Permisos y Seguridad
- **Setup inicial**: README-SETUP.md → "Configurar Permisos"
- **Problemas detallados**: TROUBLESHOOTING-2025.md → "Permisos y Seguridad"
- **SIP y scripting**: arch-macos-setup-2025.md → "Deshabilitar SIP"

### Instalación
- **Primera vez**: `./install-arch-macos-fixed.sh`
- **Error de GitHub**: `./fix-github-connection.sh`
- **Manual**: TROUBLESHOOTING-2025.md → "Instalación Manual"

---

## 🆘 ¿Qué Hacer Si...?

| Problema | Archivo | Sección |
|----------|---------|---------|
| Error de conexión GitHub | SOLUCION-RAPIDA.md | Todas |
| Yabai no inicia | TROUBLESHOOTING-2025.md | "Yabai & Skhd" |
| Atajos no funcionan | TROUBLESHOOTING-2025.md | "Skhd no responde" |
| SketchyBar invisible | TROUBLESHOOTING-2025.md | "SketchyBar" |
| Permisos negados | TROUBLESHOOTING-2025.md | "Permisos y Seguridad" |
| No sé qué es nuevo | WHATS-NEW-2025.md | Todas |
| Quiero alternativas | WHATS-NEW-2025.md | "Nuevas Herramientas" |
| Comandos para ventas | sales-workflow-cli-guide.md | Todas |

---

## 📊 Estadísticas de Documentación

```
Total de archivos: 10
Total de palabras: ~40,000
Tiempo de lectura total: ~3 horas
Scripts ejecutables: 4
```

### Por Tipo

- 📚 Guías: 5 archivos
- 🛠️ Scripts: 4 archivos
- 📑 Índice: 1 archivo

### Por Nivel

- 🌱 Principiante: README-SETUP.md, SOLUCION-RAPIDA.md
- 🌿 Intermedio: arch-macos-setup-2025.md, TROUBLESHOOTING-2025.md
- 🌳 Avanzado: WHATS-NEW-2025.md, sales-workflow-cli-guide.md

---

## 🎯 Roadmap de Uso

### Día 1: Instalación
- [ ] Leer README-SETUP.md
- [ ] Ejecutar fix-github-connection.sh (si hay error)
- [ ] Ejecutar install-arch-macos-fixed.sh
- [ ] Configurar permisos
- [ ] Probar atajos básicos

### Semana 1: Familiarización
- [ ] Leer arch-macos-setup-2025.md
- [ ] Personalizar atajos en .skhdrc
- [ ] Configurar terminal favorita
- [ ] Explorar workspaces
- [ ] Aprender layouts (bsp, float)

### Mes 1: Optimización
- [ ] Leer WHATS-NEW-2025.md
- [ ] Probar herramientas nuevas
- [ ] Configurar dotfiles en Git
- [ ] Personalizar SketchyBar
- [ ] Optimizar workflow

### Continuo: Maestría
- [ ] Explorar alternativas
- [ ] Contribuir a comunidad
- [ ] Crear tus propios plugins
- [ ] Compartir configuraciones

---

## 💡 Tips de Navegación

### Búsqueda en Archivos

```bash
# Buscar un término en todas las guías
grep -r "término" *.md

# Buscar en archivo específico
grep "término" TROUBLESHOOTING-2025.md

# Con contexto (3 líneas antes y después)
grep -C 3 "término" *.md
```

### Abrir en Editor

```bash
# Abrir todos en VS Code
code *.md

# Abrir en Neovim
nvim README-SETUP.md

# Abrir en navegador (convertir MD a HTML)
# Usa extensión de navegador o Marked 2 app
```

### Crear PDFs

```bash
# Con pandoc
pandoc README-SETUP.md -o README-SETUP.pdf
pandoc arch-macos-setup-2025.md -o arch-macos-setup-2025.pdf

# O usa Typora, Marked 2, etc.
```

---

## 🔗 Enlaces Útiles

### Repositorios Oficiales
- [Yabai](https://github.com/koekeishiya/yabai)
- [Skhd](https://github.com/koekeishiya/skhd)
- [SketchyBar](https://github.com/FelixKratz/SketchyBar)

### Comunidad
- [Discord Yabai](https://discord.gg/yabai)
- [Reddit r/yabai](https://reddit.com/r/yabai)
- [Reddit r/unixporn](https://reddit.com/r/unixporn)

### Dotfiles Inspiración
- [linkarzu/dotfiles-latest](https://github.com/linkarzu/dotfiles-latest)
- [FelixKratz/dotfiles](https://github.com/FelixKratz/dotfiles)
- [Julian-Heng/yabai-config](https://github.com/julian-heng/yabai-config)

---

## 📝 Notas de Versión

### v2.0 - Noviembre 2025 (ACTUAL)
- ✅ Correcciones para errores de conexión
- ✅ Scripts con manejo de errores
- ✅ Guía de troubleshooting completa
- ✅ Documentación de novedades 2025
- ✅ Alternativas y herramientas nuevas

### v1.0 - Inicial
- 📦 Setup básico
- 📚 Guías principales
- 🛠️ Script de instalación original
- 💼 Comandos para ventas

---

## 🎉 ¡Comienza Ahora!

**Tu próximo paso**:

1. Lee: [SOLUCION-RAPIDA.md](SOLUCION-RAPIDA.md)
2. Ejecuta: `./fix-github-connection.sh`
3. Instala: `./install-arch-macos-fixed.sh`

**¡Disfruta tu nuevo setup Arch-like en macOS! 🚀**

---

**Última actualización**: Noviembre 2025
**Mantenedor**: Setup Automatizado
**Licencia**: MIT (usa y modifica libremente)
