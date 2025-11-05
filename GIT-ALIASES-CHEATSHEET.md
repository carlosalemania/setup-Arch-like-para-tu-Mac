# 🌿 Git Hollywood Aliases - Cheat Sheet

## ✅ Instalación Completada

Los aliases han sido instalados en: `~/.bashrc`

## 🚀 Activar Aliases

```bash
# En la terminal actual
source ~/.bashrc

# O simplemente abre una nueva terminal
```

---

## 📊 Git Log Básico

### Visualización Simple

```bash
glog            # Log gráfico simple
```
Muestra:
```
* a1b2c3d Fix bug
* e4f5g6h Add feature
* i7j8k9l Initial commit
```

```bash
gloga           # Log de TODAS las ramas (local + remote)
```

### Límite de Commits

```bash
glog5           # Últimos 5 commits
glog10          # Últimos 10 commits
glog20          # Últimos 20 commits
```

---

## 🎨 Git Log Avanzado

### Log Detallado

```bash
glogd           # Con autor y fecha relativa
```
Muestra:
```
* a1b2c3d Carlos García hace 2 horas - Fix authentication bug
* e4f5g6h John Doe hace 1 día - Add user profile page
```

```bash
glogda          # Lo mismo pero todas las ramas
```

### Log Ultra Fancy (RECOMENDADO) ⭐

```bash
glogf           # Log decorado con colores
```
Muestra:
```
* a1b2c3d - (HEAD -> main, origin/main) Fix authentication bug (hace 2 horas) <Carlos García>
* e4f5g6h - Add user profile page (hace 1 día) <John Doe>
```

```bash
glogfa          # Lo mismo con todas las ramas
```

### Log con Estadísticas

```bash
glogs           # Log con archivos modificados
```
Muestra commits + archivos cambiados y líneas añadidas/eliminadas

### Log con Fechas Absolutas

```bash
glogdate        # Con fecha en formato YYYY-MM-DD
```

---

## 🔍 Git Búsqueda Avanzada

### Buscar en Mensajes de Commit

```bash
gloggrep "fix"          # Commits que contienen "fix"
gloggrep "bug"          # Commits que contienen "bug"
gloggrep "feature"      # Commits que contienen "feature"
```

### Buscar por Autor

```bash
glogauthor "Carlos"              # Commits de Carlos
glogauthor "john@example.com"    # Commits de este email
```

### Buscar desde Fecha

```bash
glogsince "2024-01-01"          # Desde año nuevo
glogsince "2 weeks ago"         # Últimas 2 semanas
glogsince "yesterday"           # Desde ayer
glogsince "1 month ago"         # Último mes
```

### Log de Archivo Específico

```bash
glogfile package.json           # Historia de package.json
glogfile src/app.js             # Historia de app.js
glogfile "*.md"                 # Historia de archivos markdown
```

### Búsqueda en Commit Messages

```bash
glogsearch "JIRA-123"           # Commits con ticket JIRA-123
glogsearch "hotfix"             # Commits de hotfix
```

---

## 📝 Git Diff y Show

### Ver Diferencias

```bash
gdiff           # Diff de cambios no staged (con bat)
gdiffs          # Diff de cambios staged (con bat)
```

### Ver Commit Específico

```bash
gshow           # Show del último commit (con bat)
gshow a1b2c3d   # Show de commit específico
```

### Git Status

```bash
gstatus         # Status resumido con bat
```

---

## 🎬 Hollywood Mode Aliases

```bash
hollywood       # Ejecutar Hollywood Ultimate
hw-pro          # Ejecutar Hollywood Pro
hw-check        # Verificar instalación
hw-stop         # Detener procesos
hw-install      # Instalar herramientas
```

---

## 📊 Monitoreo del Sistema

```bash
sys             # btop - Monitor visual
sysmon          # glances - Monitor completo
net             # bmon - Monitor de red
disk            # duf - Uso de disco
temp            # Temperatura del CPU
processes       # procs ordenado por CPU
```

---

## 🎭 Diversión

```bash
matrix          # Efecto Matrix
aquarium        # Acuario ASCII animado
pipes           # Pipes animadas
train           # Tren ASCII (typo de 'ls')
quote           # Fortune cow con colores arcoíris
```

---

## 🐳 Docker (si lo usas)

```bash
dps             # docker ps
dlogs           # docker logs -f
dexec           # docker exec -it
dstop           # Detener todos los containers
dclean          # Limpiar sistema Docker
lzd             # lazydocker (TUI)
```

---

## 🌐 Network

```bash
ports           # Ver puertos abiertos
myip            # Ver tu IP pública
speedtest       # Test de velocidad
ping            # Gping (ping gráfico)
```

---

## 💡 Git Shortcuts Adicionales

```bash
gs              # git status
ga              # git add
gc              # git commit
gp              # git push
gpl             # git pull
gco             # git checkout
gb              # git branch
gm              # git merge
```

---

## 🎯 Ejemplos Prácticos

### Workflow típico de desarrollo

```bash
# 1. Ver estado
gs

# 2. Ver últimos cambios
glog5

# 3. Ver diferencias
gdiff

# 4. Agregar archivos
ga .

# 5. Commit
gc -m "Add new feature"

# 6. Ver log fancy
glogf

# 7. Push
gp
```

### Debugging de código

```bash
# ¿Quién modificó este archivo?
glogfile src/bug.js

# ¿Qué commits tienen "fix" en el mensaje?
gloggrep fix

# ¿Qué hizo Carlos la semana pasada?
glogauthor "Carlos" && glogsince "1 week ago"
```

### Code review

```bash
# Ver log fancy de todas las ramas
glogfa

# Ver cambios en rama feature
git checkout feature
glogf

# Ver diff con main
git diff main --color=always | bat
```

### Buscar cuándo se introdujo un bug

```bash
# Ver commits de la última semana
glogsince "1 week ago"

# Buscar commits con "authentication"
gloggrep authentication

# Ver cambios en archivo específico
glogfile src/auth.js
```

---

## 🔧 Personalización

### Añadir tus propios aliases

Edita `~/.bashrc` y añade:

```bash
# Mis aliases custom
alias glogmine='git log --author="Mi Nombre" --graph --oneline --color=always | bat'
alias glogtoday='git log --since="today" --graph --oneline --color=always | bat'
```

Luego ejecuta:
```bash
source ~/.bashrc
```

---

## 📚 Combinaciones Útiles

### Git log con lolcat (arcoíris)

```bash
git log --graph --oneline -10 | lolcat
```

### Git log con figlet

```bash
echo "GIT LOG" | figlet | lolcat
git log --graph --oneline -5 --color=always | bat
```

### Mostrar log en Hollywood Mode

```bash
# Abrir ventana con git log live
osascript -e 'tell application "Terminal" to do script "watch -n 2 -c \"git log --graph --oneline -20 --color=always | bat --paging=never\""'
```

---

## 🆘 Troubleshooting

### Aliases no funcionan

```bash
# Verificar que existen
alias | grep glog

# Recargar configuración
source ~/.bashrc

# O abre nueva terminal
```

### Bat no colorea correctamente

```bash
# Usar con --color=always en git
git log --graph --oneline --color=always | bat
```

### Ver backup de configuración

```bash
ls -la ~/.bashrc.backup-*
```

---

## 📖 Recursos

**Documentación relacionada:**
- `HOLLYWOOD-README.md` - Guía Hollywood Mode
- `HOLLYWOOD-TOOLS-REFERENCE.md` - Referencia completa
- `HOLLYWOOD-QUICKSTART.md` - Inicio rápido

**Verificar instalación:**
```bash
hw-check
```

**Ver todos los aliases:**
```bash
alias | grep git
alias | grep hw
alias | grep -E "sys|net|disk"
```

---

## 🎬 Quick Start

```bash
# 1. Activar aliases
source ~/.bashrc

# 2. Probar git log básico
glog

# 3. Probar git log fancy
glogf

# 4. Buscar algo
gloggrep "fix"

# 5. Ver últimos 10 commits
glog10

# 6. ¡Disfrutar! 🎭
```

---

**¡Disfruta de tus nuevos aliases de Git Hollywood!** 🌿✨

Para más info: `cat GIT-ALIASES-CHEATSHEET.md`
