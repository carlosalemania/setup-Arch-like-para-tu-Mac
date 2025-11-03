# 🚀 Guía Rápida de Uso - Setup Arch-like macOS

**Tu setup está 100% configurado y funcionando!** Esta guía te muestra cómo aprovechar todas las mejoras.

---

## ✅ Estado Actual

```
✅ Window Manager: FUNCIONANDO (yabai + skhd)
✅ CLI Tools: INSTALADAS (13 herramientas)
✅ Tmux: CONFIGURADO con plugins
✅ Aliases modernos: ACTIVOS
✅ Documentación: COMPLETA
```

---

## 🎮 1. Atajos de Teclado Esenciales

### Para Empezar (Los Más Útiles)

| Atajo | Acción | Uso |
|-------|--------|-----|
| `Cmd + Shift + Return` | Abrir Terminal | Tu comando más usado |
| `Cmd + Shift + H/J/K/L` | Navegar ventanas | Izq/Abajo/Arriba/Der |
| `Cmd + Shift + F` | Fullscreen | Maximizar ventana actual |
| `Cmd + Shift + Space` | Toggle Float/Tile | Cambiar modo de ventana |
| `Cmd + Shift + 1-6` | Ir a workspace 1-6 | Organizar por proyectos |

### Multi-Monitor (SI tienes varios monitores)

| Atajo | Acción |
|-------|--------|
| `Alt + S` | Mover ventana a monitor izquierdo |
| `Alt + G` | Mover ventana a monitor derecho |

### Gestión de Espacios (Workspaces)

| Atajo | Acción |
|-------|--------|
| `Cmd + Alt + N` | Crear nuevo espacio |
| `Cmd + Alt + W` | Destruir espacio actual |
| `Cmd + Shift + N/P` | Siguiente/Anterior espacio |

---

## 💻 2. Comandos CLI Modernos

### Ahora en tu terminal (abre nueva pestaña: Cmd+T):

```bash
# En lugar de 'ls', ahora tienes eza con íconos
ls              # Lista con íconos y colores
ll              # Lista detallada con todo
lt              # Vista de árbol (2 niveles)

# En lugar de 'cat', ahora tienes bat con colores
cat archivo.txt # Muestra con syntax highlighting
cat ~/.zshrc    # Pruébalo con tu configuración

# En lugar de 'cd', ahora tienes zoxide (inteligente)
z Desktop       # Salta a Desktop
z docs          # Busca carpeta que contenga 'docs'
z -            # Vuelve a carpeta anterior

# Buscar archivos (fd en lugar de find)
fd nombre       # Busca archivo llamado 'nombre'
fd "\.js$"      # Busca todos los .js

# Buscar en archivos (ripgrep en lugar de grep)
rg "texto"      # Busca texto en archivos
rg "function" --type js  # Solo en archivos JS

# Git diff mejorado (delta)
git diff        # Ahora con colores hermosos

# Man pages simplificadas
tldr ls         # Ejemplos prácticos de ls
tldr git        # Ejemplos de git
```

---

## 🎯 3. Funciones Útiles Nuevas

```bash
# Crear directorio y entrar
mkcd mi-proyecto/nuevo-folder

# Extraer cualquier archivo comprimido
extract archivo.zip
extract documento.tar.gz

# Matar proceso en puerto específico
killport 3000   # Mata lo que esté en puerto 3000

# Backup rápido con timestamp
backup importante.txt
# Crea: importante.txt.backup-20251103-150230

# Ver tu IP pública
myip

# Ver el clima
weather
weather Madrid

# Limpiar .DS_Store del directorio actual
cleanup-ds
```

---

## 🖥️ 4. Usar Tmux (Terminal Multiplexer)

### Iniciar Tmux

```bash
# Primera vez: instalar plugins
tmux
# Presiona: Ctrl+Space luego I (mayúscula)
# Espera a que se instalen los plugins
# Presiona: Ctrl+Space luego D para salir

# Usar tmux normalmente
tmux              # Nueva sesión
tmux attach       # Reconectar a sesión
```

### Atajos Tmux Esenciales

**Prefix = Ctrl+Space** (más ergonómico que Ctrl+B)

| Atajo | Acción |
|-------|--------|
| `Ctrl+Space` luego `|` | Split vertical |
| `Ctrl+Space` luego `-` | Split horizontal |
| `Alt + H/J/K/L` | Navegar entre panes (SIN prefix) |
| `Ctrl+Space` luego `H/J/K/L` | Redimensionar pane |
| `Ctrl+Space` luego `M` | Maximizar/minimizar pane |
| `Ctrl+Space` luego `C` | Nueva ventana |
| `Ctrl+Space` luego `N/P` | Siguiente/anterior ventana |
| `Ctrl+Space` luego `[` | Modo scroll/copy |
| `Ctrl+Space` luego `D` | Detach sesión |

### Guardar/Restaurar Sesiones Tmux

```bash
# Guardar sesión actual
Ctrl+Space luego Ctrl+S

# Restaurar última sesión
Ctrl+Space luego Ctrl+R
```

---

## 🎨 5. Workflows Recomendados

### Workflow de Desarrollo

```bash
# 1. Crear proyecto
mkcd ~/proyectos/mi-app

# 2. Abrir en workspace dedicado
# Presiona: Cmd + Shift + 2 (workspace 2)

# 3. Iniciar tmux
tmux new -s mi-app

# 4. Crear splits
# Ctrl+Space | (split vertical)
# Alt+L (ir a panel derecho)
# Ctrl+Space - (split horizontal en derecha)

# Panel 1 (izquierda): Editor
nvim src/

# Panel 2 (arriba-derecha): Servidor
npm run dev

# Panel 3 (abajo-derecha): Git/Tests
git status

# Navegar entre paneles: Alt+H/J/K/L
```

### Workflow Multi-Proyecto

```bash
# Workspace 1: Navegador y email
Cmd + Shift + 1

# Workspace 2: Proyecto A
Cmd + Shift + 2

# Workspace 3: Proyecto B
Cmd + Shift + 3

# Workspace 4: Terminal y herramientas
Cmd + Shift + 4

# Cambiar entre workspaces:
Cmd + Shift + 1-6
```

---

## 🔧 6. Comandos de Mantenimiento

### Ver Estado del Sistema

```bash
wm-status       # Estado de yabai y skhd
```

### Recargar Configuraciones

```bash
wm-reload       # Reinicia yabai y skhd
source ~/.zshrc # Recarga aliases y funciones
```

### Iniciar/Detener Servicios

```bash
ystart          # Iniciar yabai
ystop           # Detener yabai
yrestart        # Reiniciar yabai

sstart          # Iniciar skhd
sstop           # Detener skhd
srestart        # Reiniciar skhd
```

### Actualizar Sistema

```bash
update          # brew update && upgrade && cleanup
```

---

## 🎯 7. Escenarios Comunes

### Escenario 1: Trabajar con 2 Monitores

```bash
# Mover ventana actual a otro monitor
Alt + S         # A monitor izquierdo
Alt + G         # A monitor derecho

# Enfocar monitor específico
Ctrl + Alt + 1  # Monitor 1
Ctrl + Alt + 2  # Monitor 2
```

### Escenario 2: Organizar Ventanas Rápidamente

```bash
# Tienes 4 ventanas desordenadas
Cmd + Shift + 0     # Balancear todas

# Hacer fullscreen de una
Cmd + Shift + F

# Rotar layout
Cmd + Shift + R

# Float una ventana específica
Cmd + Shift + T
```

### Escenario 3: Búsqueda Rápida de Archivos

```bash
# Buscar por nombre
fd config

# Buscar por extensión
fd -e js -e ts

# Buscar contenido en archivos
rg "import React"

# Buscar en archivos específicos
rg "function" --type py
```

---

## 📖 8. Documentación Completa

Si necesitas más información:

```bash
# Leer documentación
cat README.md | bat
cat TROUBLESHOOTING-2025.md | bat

# Ver todos los atajos de skhd
cat ~/.skhdrc | bat

# Ver configuración de yabai
cat ~/.yabairc | bat

# Ver todas las funciones disponibles
cat ~/.zshrc | bat | grep "^[a-z]*() {"
```

---

## 🎓 9. Tips Pro

### Usar FZF para Búsqueda Fuzzy

```bash
# Buscar archivos interactivamente
Ctrl+T          # En terminal, busca archivos

# Buscar en historial de comandos
Ctrl+R          # Búsqueda fuzzy en historial

# Cambiar directorios interactivamente
Alt+C           # Busca y cambia a directorio
```

### Combinar Herramientas

```bash
# Buscar y editar archivo
fd config | fzf | xargs nvim

# Buscar texto y ver contexto
rg "error" -A 3 -B 3

# Ver logs con colores
tail -f app.log | bat --paging=never

# Listar con árbol y less
lt | less
```

### Aliases Git

```bash
gs              # git status
ga .            # git add .
gc -m "msg"     # git commit
gp              # git push
gl              # git log --oneline --graph
```

---

## 🆘 10. Solución Rápida de Problemas

### Los atajos no funcionan

```bash
# Verificar que skhd esté corriendo
wm-status

# Reiniciar skhd
skhd --restart-service

# Ver errores
tail -f /tmp/skhd_$USER.err.log
```

### Las ventanas no se organizan

```bash
# Verificar yabai
wm-status

# Reiniciar yabai
yabai --restart-service

# Ver errores
tail -f /tmp/yabai_$USER.err.log
```

### Los aliases no funcionan

```bash
# Abrir NUEVA terminal (Cmd+N o Cmd+T)
# Los aliases solo se activan en nuevas terminales

# O recargar manualmente
source ~/.zshrc
```

---

## 🎉 ¡Disfruta tu Setup!

Tu Mac ahora es un entorno de desarrollo tipo Arch Linux profesional.

**Recuerda:**
- Practica los atajos regularmente
- Experimenta con los comandos CLI
- Personaliza según tu workflow
- Lee la documentación completa cuando tengas tiempo

**Para más ayuda:**
```bash
./verificar-setup.sh    # Ver estado del sistema
cat TROUBLESHOOTING-2025.md | bat  # Guía de problemas
```

---

*Creado: Noviembre 3, 2025*
*Versión: 1.0*
