# ⚡ Comandos Rápidos - Cheat Sheet

## 🚀 Activar Sistema
```bash
source ~/.bashrc        # Activar aliases (PRIMERO)
hw-check               # Verificar instalación
```

---

## 🎬 Hollywood Mode

| Comando | Qué Hace |
|---------|----------|
| `hollywood` | Menú interactivo (4 modos) |
| `hw-pro` | Hollywood PRO automático (10 ventanas) |
| `hw-check` | Ver qué está instalado (34/36) |
| `hw-stop` | Detener todos los procesos |
| `hw-install` | Instalar herramientas |

---

## 🌿 Git Log

| Comando | Qué Hace | Ejemplo |
|---------|----------|---------|
| `glog` | Log simple | commits recientes |
| `glogf` ⭐ | Log fancy detallado | mejor visualización |
| `glogfa` | Log fancy todas las ramas | con remote |
| `glog5/10/20` | Últimos N commits | solo recientes |
| `glogs` | Log con estadísticas | archivos + líneas |

---

## 🔍 Git Búsqueda

| Comando | Ejemplo | Qué Hace |
|---------|---------|----------|
| `gloggrep` | `gloggrep "fix"` | Buscar en commits |
| `glogauthor` | `glogauthor "Carlos"` | Commits por autor |
| `glogsince` | `glogsince "1 week ago"` | Desde fecha |
| `glogfile` | `glogfile app.js` | Historia de archivo |

---

## 📝 Git Diff

| Comando | Qué Hace |
|---------|----------|
| `gdiff` | Ver cambios NO staged |
| `gdiffs` | Ver cambios staged |
| `gshow` | Ver último commit |
| `gstatus` | Estado resumido |

---

## 🎯 Git Atajos

```bash
gs      # git status
ga      # git add
gc      # git commit
gp      # git push
gpl     # git pull
gco     # git checkout
gb      # git branch
gm      # git merge
```

---

## 📊 Monitoreo Sistema

| Comando | Qué Muestra | Salir |
|---------|-------------|-------|
| `sys` | BTOP (CPU, RAM, procesos) | `q` |
| `sysmon` | Glances (todo en uno) | `q` |
| `processes` | Procesos por CPU | - |
| `temp` | Temperatura CPU | - |

---

## 🌐 Monitoreo Red

| Comando | Qué Hace |
|---------|----------|
| `net` | Ancho de banda (gráfico) |
| `ports` | Puertos abiertos |
| `myip` | Tu IP pública |
| `speedtest` | Test velocidad internet |
| `ping` | Ping gráfico |

---

## 💾 Disco

| Comando | Qué Hace |
|---------|----------|
| `disk` | Uso de disco visual |

---

## 🎭 Diversión

| Comando | Qué Hace | Salir |
|---------|----------|-------|
| `matrix` | Efecto Matrix | Ctrl+C |
| `quote` | Vaca con frase colorida | - |
| `aquarium` | Acuario ASCII | Ctrl+C |
| `train` | Tren animado | espera |

---

## 🐳 Docker

```bash
dps       # docker ps
dlogs     # docker logs -f
dexec     # docker exec -it
dstop     # Detener todos
dclean    # Limpiar sistema
lzd       # LazyDocker UI
```

---

## 💡 Workflows Comunes

### Ver cambios de hoy
```bash
glogsince "today"
gdiff
gs
```

### Buscar bug
```bash
gloggrep "authentication"
glogfile src/auth.js
gshow a1b2c3d
```

### Commit workflow
```bash
gs              # Ver estado
gdiff           # Ver cambios
ga .            # Agregar
gdiffs          # Ver staged
gc -m "msg"     # Commit
glogf           # Verificar
gp              # Push
```

### Sistema lento
```bash
sys             # Ver procesos
processes       # Ver CPU
net             # Ver red
disk            # Ver disco
temp            # Ver temperatura
```

---

## 🆘 Problemas

### Aliases no funcionan
```bash
source ~/.bashrc
```

### Comando no existe
```bash
hw-check        # Ver qué falta
hw-install      # Instalar
```

---

## 📚 Ver Guías

```bash
cat GUIA-COMPLETA-USO.md              # Esta guía completa
cat COMANDOS-RAPIDOS.md               # Este cheat sheet
cat GIT-ALIASES-CHEATSHEET.md         # Git detallado
cat HOLLYWOOD-TOOLS-REFERENCE.md      # Herramientas
```

---

## ⭐ Top 10 Comandos

1. `glogf` - Log Git fancy
2. `gdiff` - Ver cambios
3. `sys` - Monitor sistema
4. `hw-check` - Verificar
5. `gloggrep` - Buscar commits
6. `hollywood` - Hollywood Mode
7. `disk` - Uso disco
8. `gshow` - Ver commit
9. `processes` - Ver CPU
10. `quote` - Diversión

---

**Tip**: Imprime esta página para tenerla a mano 📄

Para más detalles: `cat GUIA-COMPLETA-USO.md`
