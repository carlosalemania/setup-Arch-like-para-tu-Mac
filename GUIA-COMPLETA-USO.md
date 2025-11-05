# 📚 Guía Completa de Uso - Hollywood Mode & Git Aliases

## 🎯 Tabla de Contenidos

1. [Inicio Rápido](#inicio-rápido)
2. [Comandos Hollywood Mode](#comandos-hollywood-mode)
3. [Comandos Git + Bat](#comandos-git--bat)
4. [Herramientas de Monitoreo](#herramientas-de-monitoreo)
5. [Herramientas de Diversión](#herramientas-de-diversión)
6. [Ejemplos Prácticos](#ejemplos-prácticos)

---

## 🚀 Inicio Rápido

### Activar el Sistema

```bash
# Paso 1: Activar los aliases (IMPORTANTE - hazlo primero)
source ~/.bashrc

# Paso 2: Verificar que todo está instalado
hw-check

# Paso 3: Probar un comando
glog
```

---

## 🎬 Comandos Hollywood Mode

### 1. `hollywood`
**Qué hace**: Ejecuta Hollywood Mode Ultimate con menú interactivo

**Cómo usar**:
```bash
hollywood
```

**Qué muestra**: Un menú donde puedes elegir:
- **1** = Modo Básico (6 ventanas)
- **2** = Modo Avanzado (12 ventanas)
- **3** = Modo Ultimate (20+ ventanas)
- **4** = Modo Custom (tú eliges)

**Para qué sirve**: Abre múltiples ventanas de Terminal mostrando:
- Efecto Matrix
- Monitores de sistema (CPU, RAM, procesos)
- Monitores de red
- Logs del sistema
- Y más efectos visuales

**Cuándo usarlo**:
- Para demos
- Para monitorear tu sistema de forma visual
- Para impresionar 😎

---

### 2. `hw-pro`
**Qué hace**: Ejecuta Hollywood Mode PRO automáticamente (sin menú)

**Cómo usar**:
```bash
hw-pro
```

**Qué hace exactamente**: Abre 10 ventanas automáticamente con:
- Matrix effect
- Monitor de procesos (htop)
- Monitor de red (bmon)
- Logs del sistema
- Monitor de disco
- Y más...

**Cuándo usarlo**: Cuando quieres Hollywood Mode rápido sin elegir opciones

---

### 3. `hw-check`
**Qué hace**: Verifica qué herramientas están instaladas

**Cómo usar**:
```bash
hw-check
```

**Qué muestra**:
```
✓ cmatrix - Matrix effect
✓ htop - Process monitor
✗ bottom - System monitor (Rust) (no instalado)
...
Total: 34/36 (94%)
```

**Para qué sirve**: Para ver qué herramientas tienes y cuáles faltan

**Cuándo usarlo**:
- Después de instalar
- Para diagnosticar problemas
- Para ver el estado del sistema

---

### 4. `hw-stop`
**Qué hace**: Detiene todos los procesos de Hollywood Mode

**Cómo usar**:
```bash
hw-stop
```

**Qué hace exactamente**: Mata los procesos:
- cmatrix
- htop
- nettop
- glances

**Cuándo usarlo**: Cuando quieres parar todas las ventanas de Hollywood Mode de golpe

**Nota**: Las ventanas de Terminal siguen abiertas, ciérralas con `Cmd+W`

---

### 5. `hw-install`
**Qué hace**: Instala todas las herramientas de Hollywood Mode

**Cómo usar**:
```bash
hw-install
```

**Qué instala**: 36 herramientas incluyendo:
- cmatrix, htop, btop, glances
- bmon, nmap, iftop, nethogs
- bat, jq, figlet, lolcat
- Y muchas más...

**Cuándo usarlo**:
- Primera vez que configuras Hollywood Mode
- Si falta alguna herramienta

---

## 🌿 Comandos Git + Bat

### Comandos Básicos de Visualización

#### 1. `glog`
**Qué hace**: Muestra el historial de Git en forma de gráfico con colores

**Cómo usar**:
```bash
glog
```

**Ejemplo de output**:
```
* a1b2c3d Fix authentication bug
* e4f5g6h Add user profile
* i7j8k9l Initial commit
```

**Para qué sirve**: Ver rápidamente los commits recientes de forma visual

**Equivale a**: `git log --graph --oneline --color=always | bat`

---

#### 2. `gloga`
**Qué hace**: Lo mismo que `glog` pero muestra TODAS las ramas (locales y remotas)

**Cómo usar**:
```bash
gloga
```

**Para qué sirve**: Ver el historial completo de todas las ramas del proyecto

**Cuándo usarlo**: Cuando trabajas con múltiples ramas y quieres ver todo

---

#### 3. `glog5`, `glog10`, `glog20`
**Qué hace**: Muestra los últimos 5, 10 o 20 commits

**Cómo usar**:
```bash
glog5    # Últimos 5 commits
glog10   # Últimos 10 commits
glog20   # Últimos 20 commits
```

**Para qué sirve**: Limitar la cantidad de commits mostrados

**Cuándo usarlo**: Cuando solo te interesan los commits más recientes

---

### Comandos Avanzados de Visualización

#### 4. `glogf` ⭐ RECOMENDADO
**Qué hace**: Muestra el log de forma MUY detallada y con colores fancy

**Cómo usar**:
```bash
glogf
```

**Ejemplo de output**:
```
* a1b2c3d - (HEAD -> main, origin/main) Fix auth bug (hace 2 horas) <Carlos García>
* e4f5g6h - Add user profile page (hace 1 día) <John Doe>
```

**Para qué sirve**: Ver log con:
- Hash del commit
- Rama actual
- Mensaje
- Tiempo relativo (hace X horas)
- Autor

**Cuándo usarlo**: Cuando necesitas ver todos los detalles de los commits

---

#### 5. `glogfa`
**Qué hace**: Lo mismo que `glogf` pero con todas las ramas

**Cómo usar**:
```bash
glogfa
```

---

#### 6. `glogd`
**Qué hace**: Log detallado con autor y fecha relativa

**Cómo usar**:
```bash
glogd
```

**Ejemplo**:
```
* a1b2c3d Carlos García hace 2 horas - Fix bug
* e4f5g6h John Doe hace 1 día - Add feature
```

---

#### 7. `glogs`
**Qué hace**: Log con estadísticas de archivos modificados

**Cómo usar**:
```bash
glogs
```

**Qué muestra**:
```
* a1b2c3d Fix bug
  src/auth.js | 15 ++++++++---
  tests/auth.test.js | 8 ++++++
  2 files changed, 20 insertions(+), 3 deletions(-)
```

**Para qué sirve**: Ver qué archivos cambiaron en cada commit

---

#### 8. `glogdate`
**Qué hace**: Log con fechas absolutas (YYYY-MM-DD)

**Cómo usar**:
```bash
glogdate
```

**Ejemplo**:
```
* a1b2c3d 2025-01-05 Carlos - Fix bug
* e4f5g6h 2025-01-04 John - Add feature
```

---

### Comandos de Búsqueda

#### 9. `gloggrep <texto>`
**Qué hace**: Busca commits que contienen un texto específico

**Cómo usar**:
```bash
gloggrep "fix"        # Busca commits con "fix"
gloggrep "bug"        # Busca commits con "bug"
gloggrep "feature"    # Busca commits con "feature"
```

**Ejemplo**:
```bash
gloggrep "authentication"
```
**Output**:
```
* a1b2c3d Fix authentication bug
* x9y8z7w Add authentication module
```

**Para qué sirve**: Encontrar commits relacionados con un tema específico

---

#### 10. `glogauthor "<nombre>"`
**Qué hace**: Muestra solo los commits de un autor específico

**Cómo usar**:
```bash
glogauthor "Carlos"
glogauthor "john@example.com"
glogauthor "Jane Doe"
```

**Para qué sirve**: Ver qué ha hecho un desarrollador específico

**Ejemplo**:
```bash
glogauthor "Carlos García"
```
**Output**: Todos los commits de Carlos García

---

#### 11. `glogsince "<fecha>"`
**Qué hace**: Muestra commits desde una fecha específica

**Cómo usar**:
```bash
glogsince "2024-01-01"      # Desde año nuevo
glogsince "2 weeks ago"     # Últimas 2 semanas
glogsince "yesterday"       # Desde ayer
glogsince "1 month ago"     # Último mes
glogsince "2025-01-01"      # Desde fecha específica
```

**Para qué sirve**: Ver cambios en un periodo de tiempo

---

#### 12. `glogfile <archivo>`
**Qué hace**: Muestra el historial de cambios de UN archivo específico

**Cómo usar**:
```bash
glogfile package.json
glogfile src/app.js
glogfile README.md
```

**Para qué sirve**: Ver todos los cambios que ha tenido un archivo

**Ejemplo**:
```bash
glogfile src/auth.js
```
**Output**: Todos los commits que modificaron `src/auth.js`

---

#### 13. `glogsearch "<texto>"`
**Qué hace**: Busca en los MENSAJES de commit

**Cómo usar**:
```bash
glogsearch "JIRA-123"
glogsearch "hotfix"
glogsearch "security"
```

**Para qué sirve**: Encontrar commits por su mensaje

---

### Comandos de Diff y Show

#### 14. `gdiff`
**Qué hace**: Muestra las diferencias de archivos NO staged (modificados pero no agregados)

**Cómo usar**:
```bash
gdiff
```

**Qué muestra**:
```diff
src/app.js
+ nueva línea agregada
- línea eliminada
```

**Para qué sirve**: Ver qué has cambiado antes de hacer `git add`

**Equivale a**: `git diff --color=always | bat`

---

#### 15. `gdiffs`
**Qué hace**: Muestra las diferencias de archivos STAGED (ya agregados con `git add`)

**Cómo usar**:
```bash
gdiffs
```

**Para qué sirve**: Ver qué vas a commitear antes de hacer `git commit`

**Equivale a**: `git diff --staged --color=always | bat`

---

#### 16. `gshow`
**Qué hace**: Muestra los detalles de un commit (último o específico)

**Cómo usar**:
```bash
gshow              # Último commit
gshow a1b2c3d      # Commit específico
```

**Qué muestra**:
- Autor
- Fecha
- Mensaje
- Archivos cambiados
- Líneas agregadas/eliminadas

---

#### 17. `gstatus`
**Qué hace**: Muestra el estado de Git de forma resumida

**Cómo usar**:
```bash
gstatus
```

**Qué muestra**:
```
M  src/app.js      (modificado)
A  src/new.js      (agregado)
?? test.txt        (sin rastrear)
```

---

### Atajos de Git Tradicionales

```bash
gs       # git status (estado)
ga       # git add (agregar archivos)
gc       # git commit (crear commit)
gp       # git push (enviar a remoto)
gpl      # git pull (traer de remoto)
gco      # git checkout (cambiar rama)
gb       # git branch (listar ramas)
gm       # git merge (fusionar ramas)
```

---

## 📊 Herramientas de Monitoreo

### Monitoreo de Sistema

#### 1. `sys`
**Qué hace**: Abre BTOP (monitor visual de sistema)

**Cómo usar**:
```bash
sys
```

**Qué muestra**:
- Uso de CPU (gráfico)
- Uso de RAM (gráfico)
- Procesos activos
- Red
- Discos

**Controles**:
- `q` = salir
- `↑↓` = navegar
- `F9` = matar proceso

**Para qué sirve**: Ver qué está usando recursos en tu Mac

---

#### 2. `sysmon`
**Qué hace**: Abre Glances (monitor completo)

**Cómo usar**:
```bash
sysmon
```

**Qué muestra**:
- CPU, RAM, Swap
- Red, Disco, Sensores
- Procesos ordenados

**Controles**:
- `q` = salir
- `c` = ordenar por CPU
- `m` = ordenar por memoria
- `h` = ayuda

---

#### 3. `processes`
**Qué hace**: Lista procesos ordenados por uso de CPU

**Cómo usar**:
```bash
processes
```

**Para qué sirve**: Ver rápidamente qué proceso usa más CPU

---

### Monitoreo de Red

#### 4. `net`
**Qué hace**: Abre BMON (monitor de ancho de banda)

**Cómo usar**:
```bash
net
```

**Qué muestra**: Gráfico de tráfico de red en tiempo real

**Para qué sirve**: Ver cuánto ancho de banda estás usando

---

#### 5. `ports`
**Qué hace**: Lista todos los puertos abiertos en tu sistema

**Cómo usar**:
```bash
ports
```

**Qué muestra**:
```
node    12345 carlos  LISTEN :3000
chrome  67890 carlos  LISTEN :8080
```

**Para qué sirve**: Ver qué aplicaciones tienen puertos abiertos

---

#### 6. `myip`
**Qué hace**: Muestra tu dirección IP pública

**Cómo usar**:
```bash
myip
```

**Output**: `123.45.67.89`

---

#### 7. `speedtest`
**Qué hace**: Hace un test de velocidad de internet

**Cómo usar**:
```bash
speedtest
```

**Qué muestra**:
- Download speed
- Upload speed
- Ping

**Nota**: Tarda unos 30 segundos

---

#### 8. `ping`
**Qué hace**: Ping gráfico (en lugar del ping normal)

**Cómo usar**:
```bash
ping google.com
ping 8.8.8.8
```

**Qué muestra**: Gráfico en tiempo real de latencia

---

### Monitoreo de Disco

#### 9. `disk`
**Qué hace**: Muestra uso de disco de forma visual

**Cómo usar**:
```bash
disk
```

**Qué muestra**:
```
/dev/disk1s1  500GB  [████████████░░░░] 60%
/dev/disk2s1  1TB    [███░░░░░░░░░░░░░] 15%
```

---

#### 10. `temp`
**Qué hace**: Muestra temperatura del CPU

**Cómo usar**:
```bash
temp
```

**Output**: `CPU: 45.2°C`

---

## 🎭 Herramientas de Diversión

### 1. `matrix`
**Qué hace**: Efecto Matrix en tu terminal

**Cómo usar**:
```bash
matrix
```

**Cómo salir**: `Ctrl + C`

**Para qué sirve**: Efecto visual tipo "The Matrix"

---

### 2. `quote`
**Qué hace**: Muestra una vaca hablando con una frase aleatoria en colores

**Cómo usar**:
```bash
quote
```

**Ejemplo**:
```
 _____________________
< La vida es bella >
 ---------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||
```
(Con colores arcoíris)

---

### 3. `aquarium`
**Qué hace**: Acuario ASCII animado

**Cómo usar**:
```bash
aquarium
```

**Qué muestra**: Peces nadando en tu terminal

**Cómo salir**: `Ctrl + C`

---

### 4. `train`
**Qué hace**: Tren animado (cuando escribes mal 'ls')

**Cómo usar**:
```bash
train
```

**Para qué sirve**: Diversión

---

## 💡 Ejemplos Prácticos

### Ejemplo 1: Revisar trabajo del día

```bash
# Ver qué cambié hoy
glogsince "today"

# Ver archivos modificados
gs

# Ver diferencias
gdiff
```

---

### Ejemplo 2: Buscar cuándo se introdujo un bug

```bash
# Buscar commits con "authentication"
gloggrep authentication

# Ver cambios en archivo específico
glogfile src/auth.js

# Ver detalles de un commit sospechoso
gshow a1b2c3d
```

---

### Ejemplo 3: Code review de un compañero

```bash
# Ver qué hizo Juan la última semana
glogauthor "Juan"
glogsince "1 week ago"

# Ver archivos que modificó
glogfile src/module.js
```

---

### Ejemplo 4: Monitorear sistema lento

```bash
# 1. Ver procesos
sys

# 2. Ver qué usa más CPU
processes

# 3. Ver red
net

# 4. Ver disco
disk

# 5. Ver temperatura
temp
```

---

### Ejemplo 5: Workflow completo de desarrollo

```bash
# 1. Ver estado
gs

# 2. Ver últimos cambios
glog5

# 3. Ver qué cambié
gdiff

# 4. Agregar archivos
ga .

# 5. Ver qué voy a commitear
gdiffs

# 6. Hacer commit
gc -m "Add new feature"

# 7. Ver el log fancy
glogf

# 8. Push
gp
```

---

### Ejemplo 6: Presentación Hollywood Mode

```bash
# 1. Verificar todo está instalado
hw-check

# 2. Ejecutar Hollywood Ultimate
hollywood

# 3. Seleccionar modo 3 (Ultimate)

# 4. Organizar ventanas con yabai (si lo tienes)
yabai -m space --layout bsp

# 5. Disfrutar del show! 🎬
```

---

## 🔧 Comandos de Docker (Si usas Docker)

```bash
dps       # docker ps (listar containers)
dlogs     # docker logs -f (ver logs)
dexec     # docker exec -it (ejecutar en container)
dstop     # docker stop (detener todos)
dclean    # docker system prune (limpiar)
lzd       # lazydocker (interfaz gráfica)
```

---

## 🆘 Troubleshooting

### Los aliases no funcionan

```bash
# Solución: Recargar configuración
source ~/.bashrc

# O abre una nueva terminal
```

---

### El comando no existe

```bash
# Verificar instalación
hw-check

# Instalar lo que falta
hw-install
```

---

### Cómo ver esta guía rápidamente

```bash
# Ver la guía
cat GUIA-COMPLETA-USO.md

# O usar less para navegar
less GUIA-COMPLETA-USO.md
```

---

## 📚 Otras Guías Disponibles

```bash
# Inicio rápido
cat HOLLYWOOD-QUICKSTART.md

# Referencia completa de herramientas
cat HOLLYWOOD-TOOLS-REFERENCE.md

# Cheat sheet de Git
cat GIT-ALIASES-CHEATSHEET.md

# Reporte de testing
cat HOLLYWOOD-TEST-REPORT.md
```

---

## 🎯 Comandos Más Usados (Top 10)

1. **`glogf`** - Ver log fancy de Git ⭐
2. **`gdiff`** - Ver cambios antes de commit
3. **`sys`** - Monitor de sistema
4. **`hw-check`** - Verificar instalación
5. **`gloggrep`** - Buscar en commits
6. **`hollywood`** - Ejecutar Hollywood Mode
7. **`disk`** - Ver uso de disco
8. **`gshow`** - Ver detalles de commit
9. **`processes`** - Ver procesos
10. **`quote`** - Diversión

---

## ✅ Checklist de Primeros Pasos

- [ ] Activar aliases: `source ~/.bashrc`
- [ ] Verificar instalación: `hw-check`
- [ ] Probar Git log: `glogf`
- [ ] Probar monitor: `sys`
- [ ] Ejecutar Hollywood: `hollywood`
- [ ] Leer documentación: `cat GIT-ALIASES-CHEATSHEET.md`

---

**¡Disfruta de tu Hollywood Mode!** 🎬🎭✨

Para más ayuda: `cat GUIA-COMPLETA-USO.md`
